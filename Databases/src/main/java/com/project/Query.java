package com.project;

import java.sql.*;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.text.NumberFormat;


public class Query {

    public List<Room> searchAvailableRooms (String start, String end, String hotelRating, String area, String price, String capacity, String numRooms) {

        String sql = "SELECT * FROM (SELECT h.HotelAddr, r.RoomNum FROM Hotel h join Room r on h.HotelAddr = r.HotelAddr WHERE (h.NumRooms >= "+numRooms+") AND (h.starRating >= "+hotelRating+") AND (h.city = '"+area+"') AND (r.Capacity >= "+capacity+") AND (r.Price >= "+price+") \n" +
                "EXCEPT\n" +
                "SELECT * FROM (SELECT HotelAddr, RoomNum FROM Booking WHERE ((CheckInDate <= '"+end+"') AND (CheckInDate >= '"+start+"')) OR (CheckOutDate >= '"+start+"' AND CheckOutDate <= '"+end+"')\n" +
                "UNION\n" +
                "SELECT HotelAddr, RoomNum FROM Renting WHERE ((CheckInDate <= '"+end+"') AND (CheckInDate >= '"+start+"')) OR (CheckOutDate >= '"+start+"' AND CheckOutDate <= '"+end+"'))) r1 JOIN Room r2 ON r1.HotelAddr = r2.HotelAddr AND r1.RoomNum = r2.RoomNum;\n";

        ConnectionDB con = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){

                Room room = new Room(
                        rs.getString("HotelAddr"),
                        rs.getInt("RoomNum"),
                        rs.getFloat("Price"),
                        rs.getInt("Capacity"),
                        rs.getString("View"),
                        rs.getBoolean("Extendable")
                        );

                // append grade in grades list
                rooms.add(room);

            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return rooms;

    }

        public static long calculateDateDifference(String startDateStr, String endDateStr) {
            // Convert Strings to LocalDate
            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            // Calculate the difference
            long years = ChronoUnit.YEARS.between(startDate, endDate);
            long months = ChronoUnit.MONTHS.between(startDate, endDate) % 12;
            long days = ChronoUnit.DAYS.between(startDate.plusYears(years).plusMonths(months), endDate); // Exact days left

            // Return formatted difference
            if (days==0) {
                days = 1;
            }
            return Math.abs(days);
        }

    public static String validateAndClean(String input) {
        try {
            // Try parsing the input as a number
            double number = Double.parseDouble(input);

            // Create a NumberFormat instance for formatting to 2 decimal places
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(0); // No digits after decimal if not needed

            // Format the number to the required pattern (XXXX.XX)
            return nf.format(number);
        } catch (NumberFormatException e) {
            // If the input is not a valid number, return the part before the dot
            if (input.contains(".")) {
                return input.split("\\.")[0]; // Return only the part before the dot
            }
            return input; // Return the original input if no dot is present
        }
    }

    public boolean createBooking(String hotelAddress, String roomNumber, String checkIn, String custID, String checkOut) {
        String duration = Long.toString(calculateDateDifference(checkIn,checkOut));
        String sql = "INSERT INTO Booking \n" +
                "VALUES ('"+hotelAddress+"', "+roomNumber+",'"+checkIn+"','"+custID+"','"+checkOut+"',"+duration+"); \n";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            st.executeUpdate(sql);

            st.close();
            con.close();
            return true;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static boolean empExists(String SIN){
        String sql = "SElECT SINOrSSN FROM Employee \n" +
                "WHERE SINOrSSN = '"+SIN+"'; \n";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");

            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            st.close();
            con.close();
            return colCount==1;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static ArrayList<Booking> getCustomerBooking(String custID){

        String sql = "SELECT * FROM Booking WHERE CustomerID = '"+  custID  +"'\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<Booking> bookings = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){

                Booking book = new Booking(
                        rs.getString("HotelAddr"),
                        rs.getString("RoomNum"),
                        rs.getString("CheckInDate"),
                        rs.getString("CustomerID"),
                        rs.getString("CheckOutDate"),
                        rs.getString("Duration")
                );


                bookings.add(book);

            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return bookings;
    }

    public static ArrayList<Renting> getCustomerRenting(String custID){

        String sql = "SELECT * FROM renting WHERE CustomerID = '"+  custID  +"' AND Balance > 0\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<Renting> rentings = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){

                Renting rent = new Renting(
                        rs.getString("HotelAddr"),
                        rs.getString("RoomNum"),
                        rs.getString("CheckInDate"),
                        rs.getString("CustomerID"),
                        rs.getString("CheckOutDate"),
                        rs.getString("Duration"),
                        rs.getString("Balance"),
                        rs.getString("EmployeeSINOrSSN")
                );


                rentings.add(rent);

            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return rentings;
    }

    public static boolean makeRenting(String hotelAddr, String roomNum, String checkInDate, String custID, String checkOutDate , String emp_SIN){
        String duration = Long.toString(calculateDateDifference(checkInDate,checkOutDate));
        String priceString = String.valueOf(getPrice(hotelAddr,roomNum,duration));
        String sql = "INSERT INTO Renting \n" +
                "VALUES ('"+hotelAddr+"', "+roomNum+",'"+checkInDate+"','"+custID+"','"+checkOutDate+"',"+duration+","+validateAndClean(priceString)+","+emp_SIN+"); \n";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            st.executeUpdate(sql);

            st.close();
            con.close();
            return true;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static int getPrice(String hotelAddr, String roomNum, String duration){
        int result = 0;
        int durationNum = Integer.parseInt(duration);
        String sql = "SELECT Price FROM Room WHERE HotelAddr = '"+  hotelAddr  +"' AND RoomNum = '"+ roomNum +"' \n";

        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()){
                result = rs.getInt("Price") * durationNum;
            }

            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return result;

    }

    public static boolean bookingToRenting(String hotelAddr, String roomNum,String checkInDate, String custID, String checkOutDate, String SIN){
        boolean flag1 = makeRenting(hotelAddr, roomNum, checkInDate, custID, checkOutDate, SIN);
        boolean flag2 = delBooking(hotelAddr, roomNum, checkInDate);
        return flag1 && flag2;
    }

    public static boolean delBooking(String hotelAddr, String roomNum, String checkInDate){
        String sql = "DELETE FROM Booking WHERE HotelAddr = '"+  hotelAddr  +"' AND RoomNum = '"+ roomNum +"' AND checkInDate = '"+ checkInDate +"' ;";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            st.executeUpdate(sql);

            st.close();
            con.close();
            return true;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }



    public static boolean makePayment(String hotelAddr, String roomNum, String checkInDate, String custID, String paymentAmount){
        LocalDate currentDate = LocalDate.now();
        String paymentDate = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String sql = "INSERT INTO Payment \n" +
                "VALUES ('"+hotelAddr+"', "+roomNum+",'"+checkInDate+"','"+custID+"','"+paymentAmount+"','"+paymentDate+"'); \n";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            st.executeUpdate(sql);

            st.close();
            con.close();
            return true;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static void main(String[] args){
        Query q = new Query();
        /*List<Room> rs = q.searchAvailableRooms("'2025-03-29'", "'2025-03-30'", 1, "'Ottawa'", 1, 1, 1);
        for (Room room : rs) {
            System.out.println(room.getRoomNum());
            System.out.println(room.getHotelAddr());

        }*/
        //q.createBooking("303 City St", "301", "2025-03-01", "C001","2025-03-02");
    }

}

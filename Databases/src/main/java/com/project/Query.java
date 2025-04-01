package com.project;

import java.sql.*;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.text.NumberFormat;


public class Query {

    public List<Room> searchAvailableRooms (String start, String end, String hotelRating, String area, String price, String capacity, String numRooms, String hotelChainID) {

        String areaQuery = (!area.isEmpty()) ? " AND (h.city = '"+area+"') " : area;
        String priceQuery  = (!price.isEmpty()) ? " AND (r.Price <= "+price+") " : price;
        String capacityQuery  = (!capacity.isEmpty()) ? " AND (r.Capacity >= "+capacity+") " : capacity;
        String numRoomsQuery  = (!numRooms.isEmpty()) ? " AND (h.NumRooms >= "+numRooms+") " : numRooms;
        String hotelChainIDQuery  = (!hotelChainID.isEmpty()) ? " AND (h.hotelChainID = "+hotelChainID+") " : hotelChainID;


        String sql = "SELECT * FROM (SELECT h.HotelAddr, r.RoomNum FROM Hotel h join Room r on h.HotelAddr = r.HotelAddr WHERE (h.starRating >= "+hotelRating+") "+hotelChainIDQuery+numRoomsQuery+areaQuery+capacityQuery+priceQuery+  " \n" +
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
            boolean exists= rs.next();
            st.close();
            con.close();
            return exists;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static boolean customerDelete(String ID){
        String sql = "DELETE FROM Customer WHERE ID = '"+ID+"'; \n";
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

    public static boolean customerUpdate(String ID, String firstName, String middleName, String lastName, String address, String idType){
        String firstNameQuery = (!firstName.isEmpty()) ? " FirstName = '"+firstName+"' " : firstName;
        String middleNameQuery  = (!middleName.isEmpty()) ? " MiddleName = '"+middleName+"' " : middleName;
        String lastNameQuery  = (!lastName.isEmpty()) ? " LastName = '"+lastName+"' " : lastName;
        String addressQuery  = (!address.isEmpty()) ? " Address = '"+address+"' " : address;
        String idTypeQuery  = (!idType.isEmpty()) ? " IDType = '"+idType+"' " : idType;

        String[] queryArray = {firstNameQuery,middleNameQuery,lastNameQuery,addressQuery,idTypeQuery};
        String tmp ="";
        for (String s :queryArray){
            tmp += (!s.isEmpty()) ? s+", ":s;
        }
        tmp=tmp.substring(0, tmp.length()-2);

        String sql = "UPDATE Customer \n" +
                "SET "+tmp+" \n" +
                "WHERE ID = '"+ID+"'; \n";
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



    public static boolean empDelete(String SIN){
        String sql = "DELETE FROM Employee WHERE SINOrSSN = '"+SIN+"'; \n";
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

    public static boolean empInsert(String SIN, String firstName, String middleName, String lastName,String address, String role, String hotelAddr){
        if(SIN.equals("") || firstName.equals("") || middleName.equals("") || lastName.equals("") || address.equals("") || role.equals("") || hotelAddr.equals("")){
            return false;
        }
        String sql = "INSERT INTO Employee VALUES("+SIN+",'"+firstName+"','"+middleName+"','"+lastName+"','"+address+"','"+role+"','"+hotelAddr+"'); \n";
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


    public static boolean empUpdate(String SIN, String firstName, String middleName, String lastName, String address, String jobTitle, String hotelAddr){
        String firstNameQuery = (!firstName.isEmpty()) ? " FirstName = '"+firstName+"' " : firstName;
        String middleNameQuery  = (!middleName.isEmpty()) ? " MiddleName = '"+middleName+"' " : middleName;
        String lastNameQuery  = (!lastName.isEmpty()) ? " LastName = '"+lastName+"' " : lastName;
        String addressQuery  = (!address.isEmpty()) ? " Address = '"+address+"' " : address;
        String jobTitleQuery  = (!jobTitle.isEmpty()) ? " Role = '"+jobTitle+"' " : jobTitle;
        String hotelAddrQuery  = (!hotelAddr.isEmpty()) ? " HotelAddr = '"+hotelAddr+"' " : hotelAddr;

        String[] queryArray = {firstNameQuery,middleNameQuery,lastNameQuery,addressQuery,jobTitleQuery,hotelAddrQuery};
        String tmp ="";
        for (String s :queryArray){
            tmp += (!s.isEmpty()) ? s+", ":s;
        }
        tmp=tmp.substring(0, tmp.length()-2);
        
        String sql = "UPDATE Employee \n" +
                "SET "+tmp+" \n" +
                "WHERE SINOrSSN = '"+SIN+"'; \n";

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

    public static boolean custExists(String ID){
        String sql = "SElECT ID FROM Customer \n" +
                "WHERE ID = '"+ID+"'; \n";
        ConnectionDB con = new ConnectionDB();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");

            ResultSet rs = st.executeQuery(sql);
            boolean exists= rs.next();
            st.close();
            con.close();
            return exists;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static boolean hotelDelete(String hotelAddr){
        String sql = "DELETE FROM Hotel WHERE HotelAddr = '"+hotelAddr+"'; \n";
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

    public static boolean hotelInsert(String hotelAddr, String city, String starRating, String hotelChainID){

        if(hotelAddr.equals("") || city.equals("") || starRating.equals("") || hotelChainID.equals("")){
            return false;
        }

        String sql = "INSERT INTO Hotel VALUES('"+hotelAddr+"', 0,'"+city+"','"+starRating+"','"+hotelChainID+"'); \n";
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

    public static boolean hotelUpdate(String hotelAddr, String city, String starRating, String hotelChainID){
        String cityQuery = (!city.isEmpty()) ? " City = '"+city+"' " : city;
        String starRatingQuery  = (!starRating.isEmpty()) ? " StarRating  = '"+starRating+"' " : starRating;
        String hotelChainIDQuery  = (!hotelChainID.isEmpty()) ? " HotelChainID  = '"+hotelChainID+"' " : hotelChainID;

        String[] queryArray = {cityQuery,starRatingQuery,hotelChainIDQuery};
        String tmp ="";
        for (String s :queryArray){
            tmp += (!s.isEmpty()) ? s+", ":s;
        }
        tmp=tmp.substring(0, tmp.length()-2);
        
        String sql = "UPDATE Hotel \n" +
                "SET "+tmp+" \n" +
                "WHERE HotelAddr = '"+hotelAddr+"'; \n";
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

    public static boolean roomDelete(String hotelAddr, String roomNum){
        String sql = "DELETE FROM Room WHERE HotelAddr = '"+hotelAddr+"' AND RoomNum = "+roomNum+"; \n";
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

    public static boolean roomInsert(String hotelAddr, String roomNum, String price, String capacity, String view, String extendable){

        if(hotelAddr.equals("") || roomNum.equals("") || price.equals("") || capacity.equals("") || view.equals("") || extendable.equals("")){
            return false;
        }

        String sql = "INSERT INTO Room VALUES('"+hotelAddr+"',"+roomNum+","+price+","+capacity+",'"+view+"',"+extendable+"); \n";
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

    public static boolean roomUpdate(String hotelAddr, String roomNum, String price, String capacity, String view, String extendable){
        String priceQuery = (!price.isEmpty()) ? " Price = "+price+" " : price;
        String capacityQuery  = (!capacity.isEmpty()) ? " Capacity  = "+capacity+" " : capacity;
        String viewQuery  = (!view.isEmpty()) ? " View  = '"+view+"' " : view;
        String extendableQuery  = (!extendable.isEmpty()) ? " Extendable  = "+extendable+" " : extendable;

        String[] queryArray = {priceQuery,capacityQuery,viewQuery,extendableQuery};
        String tmp ="";
        for (String s :queryArray){
            tmp += (!s.isEmpty()) ? s+", ":s;
        }
        tmp=tmp.substring(0, tmp.length()-2);
        
        String sql = "UPDATE Room \n" +
                "SET "+tmp+" \n" +
                "WHERE HotelAddr = '"+hotelAddr+"' AND RoomNum = "+roomNum+"; \n";
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



    public static boolean createCustomer(String ID, String firstName,String middleName, String lastName, String address,String idType){
        LocalDate currentDate = LocalDate.now();
        String dateReg = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String sql = "INSERT INTO Customer \n" +
                "VALUES ('"+ID+"', '"+firstName+"','"+middleName+"','"+lastName+"','"+address+"','"+idType+"' ,'"+dateReg+"'); \n";
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

    public static ArrayList<String> roomsPerArea(){
        String sql = "SELECT * FROM RoomsPerArea;\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<String> hotels = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){
                String tmp;
                tmp = "<tr>"
                        + "<td>" + rs.getString("City")
                        + "</td>"
                        + "<td>" + rs.getString("Number of Rooms Available")
                        + "</td>"
                        + "</tr>";
                hotels.add(tmp);
            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return hotels;
    }

    public static ArrayList<String> roomsPerArea(String city){
        String sql = "SELECT * FROM RoomsPerArea WHERE City = '" +city+ "'\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<String> hotels = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){
                String tmp;
                tmp = "<tr>"
                        + "<td>" + rs.getString("City")
                        + "</td>"
                        + "<td>" + rs.getString("Number of Rooms Available")
                        + "</td>"
                        + "</tr>";
                hotels.add(tmp);
            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return hotels;
    }

    public static ArrayList<String> getHotelCap(String hotelAddr){
        String sql = "SELECT * FROM TotalCapacity WHERE HotelAddr = '" +hotelAddr+ "'\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<String> hotels = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){
                String tmp;
                tmp = "<tr>"
                        + "<td>" + rs.getString("HotelAddr")
                        + "</td>"
                        + "<td>" + rs.getString("Maximum Number of Guests")
                        + "</td>"
                        + "</tr>";
                hotels.add(tmp);
            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return hotels;
    }

    public static ArrayList<String> getHotelCap(){
        String sql = "SELECT * FROM TotalCapacity;\n";

        ConnectionDB con = new ConnectionDB();

        ArrayList<String> hotels = new ArrayList<>();

        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){
                String tmp;
                tmp = "<tr>"
                        + "<td>" + rs.getString("HotelAddr")
                        + "</td>"
                        + "<td>" + rs.getString("Maximum Number of Guests")
                        + "</td>"
                        + "</tr>";
                hotels.add(tmp);
            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return hotels;
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

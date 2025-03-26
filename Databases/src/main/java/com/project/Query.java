package com.project;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class Query {

    public List<Room> searchAvailableRooms (String start, String end, int hotelRating, String area, float price, int capacity, int numRooms) {

        String sql = "SELECT * FROM (SELECT h.HotelAddr, r.RoomNum FROM Hotel h join Room r on h.HotelAddr = r.HotelAddr WHERE (h.NumRooms >= "+numRooms+") AND (h.starRating >= "+hotelRating+") AND (h.city = "+area+") AND (r.Capacity >= "+capacity+") \n" +
                "EXCEPT\n" +
                "SELECT * FROM (SELECT HotelAddr, RoomNum FROM Booking WHERE ((CheckInDate <= "+end+") AND (CheckInDate >= "+start+")) OR (CheckOutDate >= "+start+" AND CheckOutDate <= "+end+")\n" +
                "UNION\n" +
                "SELECT HotelAddr, RoomNum FROM Renting WHERE ((CheckInDate <= "+end+") AND (CheckInDate >= "+start+")) OR (CheckOutDate >= "+start+" AND CheckOutDate <= "+end+"))) r1 JOIN Room r2 ON r1.HotelAddr = r2.HotelAddr AND r1.RoomNum = r2.RoomNum;\n";

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

    public static void main(String[] args){
        Query q = new Query();
        List<Room> rs = q.searchAvailableRooms("'2025-03-29'", "'2025-03-30'", 1, "'Ottawa'", 1, 1, 1);
        for (Room room : rs) {
            System.out.println(room.getRoomNum());
            System.out.println(room.getHotelAddr());

        }
    }

}

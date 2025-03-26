package com.project;

import java.sql.*;

public class Room {
    private String hotelAddr;
    private int roomNum;
    private float price;
    private int cap;
    private String view;
    private boolean extendable;

    // Constructor
    public Room(String hotelAddr, int roomNum, float price, int cap, String view, boolean extendable) {
        this.hotelAddr = hotelAddr;
        this.roomNum = roomNum;
        this.price = price;
        this.cap = cap;
        this.view = view;
        this.extendable = extendable;
    }

    // Getters
    public String getHotelAddr() {
        return hotelAddr;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public float getPrice() {
        return price;
    }

    public int getCap() {
        return cap;
    }

    public String getView() {
        return view;
    }

    public boolean isExtendable() {
        return extendable;
    }

    // Setters
    public void setHotelAddr(String hotelAddr) {
        this.hotelAddr = hotelAddr;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public void setView(String view) {
        this.view = view;
    }

    public void setExtendable(boolean extendable) {
        this.extendable = extendable;
    }

    public String toString() {
        return "<tr>"
                + "<td>" + hotelAddr + "</td>"
                + "<td>" + roomNum + "</td>"
                + "<td>" + price + "</td>"
                + "<td>" + cap + "</td>"
                + "<td>" + view + "</td>"
                + "<td>" + extendable + "</td>"
                + "<td>"
                + "<form method='post' action='bookRoom.jsp'>"
                + "<input type='hidden' name='hotelAddr' value='" + hotelAddr + "'>"
                + "<input type='hidden' name='roomNum' value='" + roomNum + "'>"
                + "<input type='hidden' name='price' value='" + price + "'>"
                + "<input type='hidden' name='cap' value='" + cap + "'>"
                + "<input type='hidden' name='view' value='" + view + "'>"
                + "<input type='hidden' name='extendable' value='" + extendable + "'>"
                + "<button type='submit'>Book</button>"
                + "</form>"
                + "</td>"
                + "</tr>";
    }
}

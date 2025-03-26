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
        return "<ul>"
                + "<li>" + hotelAddr + "</li>"
                + "<li>" + roomNum + "</li>"
                + "<li>" + price + "</li>"
                + "<li>" + cap + "</li>"
                + "<li>" + view + "</li>"
                + "<li>" + extendable + "</li>"
                + "</ul>";
    }
}

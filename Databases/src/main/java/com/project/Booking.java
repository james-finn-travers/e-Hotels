package com.project;

import java.sql.*;

public class Booking {
    private String hotelAddr;
    private String roomNum;
    private String checkInDate;
    private String customerID;
    private String checkOutDate;
    private String duration;

    // Constructor
    public Booking(String hotelAddr, String roomNum, String checkInDate, String customerID, String checkOutDate, String duration) {
        this.hotelAddr = hotelAddr;
        this.roomNum = roomNum;
        this.checkInDate = checkInDate;
        this.customerID = customerID;
        this.checkOutDate = checkOutDate;
        this.duration = duration;
    }

    // Getters
    public String getHotelAddr() {
        return hotelAddr;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public String getCustomerID() {
        return customerID;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public String getDuration() {
        return duration;
    }

    // Setters
    public void setHotelAddr(String hotelAddr) {
        this.hotelAddr = hotelAddr;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    // Method to get a booking's details as an HTML table row
    public String toString(String emp_SIN) {
        return "<tr>"
                + "<td>" + hotelAddr + "</td>"
                + "<td>" + roomNum + "</td>"
                + "<td>" + checkInDate + "</td>"
                + "<td>" + customerID + "</td>"
                + "<td>" + checkOutDate + "</td>"
                + "<td>" + duration + "</td>"
                + "<td>"
                + "<form method='post' action='bookingToRenting.jsp?SIN=" +emp_SIN + " '>"
                + "<input type='hidden' name='hotelAddr' value='" + hotelAddr + "'>"
                + "<input type='hidden' name='roomNum' value='" + roomNum + "'>"
                + "<input type='hidden' name='checkInDate' value='" + checkInDate + "'>"
                + "<input type='hidden' name='customerID' value='" + customerID + "'>"
                + "<input type='hidden' name='checkOutDate' value='" + checkOutDate + "'>"
                + "<input type='hidden' name='duration' value='" + duration + "'>"
                + "<input type='hidden' name='balance' value='" + Query.getPrice(hotelAddr, roomNum, duration) + "'>"
                + "<input type='hidden' name='SIN' value='" + emp_SIN + "'>"
                + "<button name = 'rent' type='submit'>Rent</button>"
                + "</form>"
                + "</td>"
                + "</tr>";
    }

}

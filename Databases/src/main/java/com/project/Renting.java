package com.project;

public class Renting {
    private String hotelAddr;
    private String roomNum;
    private String checkInDate;
    private String custID;
    private String checkOutDate;
    private String duration;
    private String balance;
    private String SIN;

    // Constructor
    public Renting(String hotelAddr, String roomNum, String checkInDate, String custID, String checkOutDate, String duration, String balance, String SIN) {
        this.hotelAddr = hotelAddr;
        this.roomNum = roomNum;
        this.checkInDate = checkInDate;
        this.custID = custID;
        this.checkOutDate = checkOutDate;
        this.duration = duration;
        this.balance = balance;
        this.SIN = SIN;
    }

    // Getters and Setters
    public String getHotelAddr() {
        return hotelAddr;
    }

    public void setHotelAddr(String hotelAddr) {
        this.hotelAddr = hotelAddr;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getSIN() {
        return SIN;
    }

    public void setSIN(String SIN) {
        this.SIN = SIN;
    }

    public String toString(String payment) {
            return "<tr>"
                    + "<td>" + hotelAddr + "</td>"
                    + "<td>" + roomNum + "</td>"
                    + "<td>" + checkInDate + "</td>"
                    + "<td>" + custID + "</td>"
                    + "<td>" + checkOutDate + "</td>"
                    + "<td>" + duration + "</td>"
                    + "<td>" + balance + "</td>"
                    + "<td>"
                    + "<form method='post' action='payment.jsp?SIN="+SIN+"'> "
                    + "<input type='hidden' name='hotelAddr' value='" + hotelAddr + "'>"
                    + "<input type='hidden' name='roomNum' value='" + roomNum + "'>"
                    + "<input type='hidden' name='checkInDate' value='" + checkInDate + "'>"
                    + "<input type='hidden' name='custID' value='" + custID + "'>"
                    + "<input type='hidden' name='checkOutDate' value='" + checkOutDate + "'>"
                    + "<input type='hidden' name='duration' value='" + duration + "'>"
                    + "<input type='hidden' name='balance' value='" + balance + "'>"
                    + "<input type='hidden' name='payment' value='" + payment + "'>"
                    + "<button name='pay' type='submit'>Pay</button>"
                    + "</form>"
                    + "</td>"
                    + "</tr>";
        }

}

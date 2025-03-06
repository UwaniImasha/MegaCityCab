package com.megacitycab.model; 

import java.sql.Timestamp;

public class Booking {
    private String orderNo;
    private String customerRegNo;
    private String customerName;
    private String customerAddress;
    private String customerPhone;
    private String destination;
    private Timestamp bookingTime;

    public Booking(String orderNo, String customerRegNo, String customerName, String customerAddress, 
                   String customerPhone, String destination, Timestamp bookingTime) {
        this.orderNo = orderNo;
        this.customerRegNo = customerRegNo;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.destination = destination;
        this.bookingTime = bookingTime;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getCustomerRegNo() {
        return customerRegNo;
    }

    public void setCustomerRegNo(String customerRegNo) {
        this.customerRegNo = customerRegNo;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Timestamp getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Timestamp bookingTime) {
        this.bookingTime = bookingTime;
    }
}

package com.megacitycab.model;

public class Booking {
    private String orderNo;
    private String customerRegNo;
    private String name;
    private String address;
    private String phone;
    private String destination;
    private String bookingTime;

    // Constructor
    public Booking(String orderNo, String customerRegNo, String name, String address, String phone, String destination, String bookingTime) {
        this.orderNo = orderNo;
        this.customerRegNo = customerRegNo;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.destination = destination;
        this.bookingTime = bookingTime;
    }

    // Getters and Setters
    public String getOrderNo() { return orderNo; }
    public void setOrderNo(String orderNo) { this.orderNo = orderNo; }

    public String getCustomerRegNo() { return customerRegNo; }
    public void setCustomerRegNo(String customerRegNo) { this.customerRegNo = customerRegNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getBookingTime() { return bookingTime; }
    public void setBookingTime(String bookingTime) { this.bookingTime = bookingTime; }
}

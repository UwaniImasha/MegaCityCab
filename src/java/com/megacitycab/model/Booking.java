package com.megacitycab.model;

public class Booking {
    private String bookingNumber;
    private String customerId;
    private String driverId;
    private String carId;
    private String phone;
    private String pickupLocation;
    private String destination;
    private String dateTime;
    private String fare;  

    public Booking(String bookingNumber, String customerId, String driverId, String carId, String phone, 
                   String pickupLocation, String destination, String dateTime, String fare) {
        this.bookingNumber = bookingNumber;
        this.customerId = customerId;
        this.driverId = driverId;
        this.carId = carId;
        this.phone = phone;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.dateTime = dateTime;
        this.fare = fare; 
    }

    // Getters and Setters
    public String getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(String bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    // Getter and Setter for fare (String type)
    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }
}
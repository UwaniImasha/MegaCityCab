package com.megacitycab.model;

public class Driver {
    private String driverId;
    private String dName;
    private String licenseNo;
    private String contactNo;

    // Constructor
    public Driver(String driverId, String dName, String licenseNo, String contactNo) {
        this.driverId = driverId;
        this.dName = dName;
        this.licenseNo = licenseNo;
        this.contactNo = contactNo;
    }

    // Getters and Setters
    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getDName() {
        return dName;
    }

    public void setDName(String dName) {
        this.dName = dName;
    }

    public String getLicenseNo() {
        return licenseNo;
    }

    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

}

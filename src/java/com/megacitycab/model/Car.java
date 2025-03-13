package com.megacitycab.model;

public class Car {
    private String carId;
    private String model;
    private String registrationNo;
    private String carType;
    private int modelYear;
    private String fuelType;
    private String availability; // Changed from boolean to String

    // Constructor
    public Car(String carId, String model, String registrationNo, String carType, int modelYear, String fuelType, String availability) {
        this.carId = carId;
        this.model = model;
        this.registrationNo = registrationNo;
        this.carType = carType;
        this.modelYear = modelYear;
        this.fuelType = fuelType;
        this.availability = availability;
    }

    // Getters and Setters
    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public int getModelYear() {
        return modelYear;
    }

    public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

}

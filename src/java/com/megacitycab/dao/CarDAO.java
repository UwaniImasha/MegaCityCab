package com.megacitycab.dao;

import com.megacitycab.util.DBConnection;
import com.megacitycab.model.Car;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    private Connection connection;

    // Default constructor
    public CarDAO() {
        try {
            this.connection = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
    }

    // Constructor with connection
    public CarDAO(Connection con) {
        this.connection = con;
    }

    // Add new car to the database
    public boolean addCar(Car car) {
        String query = "INSERT INTO car (carId, model, registrationNo, carType, modelYear, fuelType, availability) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, car.getCarId());
            ps.setString(2, car.getModel());
            ps.setString(3, car.getRegistrationNo());
            ps.setString(4, car.getCarType());
            ps.setInt(5, car.getModelYear());
            ps.setString(6, car.getFuelType());
            ps.setString(7, car.getAvailability()); // Updated from boolean to String
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Car added successfully!");
                return true;
            } else {
                System.out.println("Failed to add car.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
            return false;
        }
    }

    // Get a list of all cars
    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT * FROM car";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                cars.add(new Car(
                        rs.getString("carId"),
                        rs.getString("model"),
                        rs.getString("registrationNo"),
                        rs.getString("carType"),
                        rs.getInt("modelYear"),
                        rs.getString("fuelType"),
                        rs.getString("availability") // Updated from boolean to String
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        System.out.println("Number of cars fetched: " + cars.size());
        return cars;
    }

    // Get car by carId
    public Car getCarById(String carId) {
        Car car = null;
        String query = "SELECT * FROM car WHERE carId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, carId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    car = new Car(
                            rs.getString("carId"),
                            rs.getString("model"),
                            rs.getString("registrationNo"),
                            rs.getString("carType"),
                            rs.getInt("modelYear"),
                            rs.getString("fuelType"),
                            rs.getString("availability") // Updated from boolean to String
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        return car;
    }

    // Update an existing car
    public boolean updateCar(Car car) {
        String query = "UPDATE car SET model=?, registrationNo=?, carType=?, modelYear=?, fuelType=?, availability=? WHERE carId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, car.getModel());
            ps.setString(2, car.getRegistrationNo());
            ps.setString(3, car.getCarType());
            ps.setInt(4, car.getModelYear());
            ps.setString(5, car.getFuelType());
            ps.setString(6, car.getAvailability()); // Updated from boolean to String
            ps.setString(7, car.getCarId());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Car updated successfully!");
                return true;
            } else {
                System.out.println("Failed to update car.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        return false;
    }

    // Delete a car from the database
    public boolean deleteCar(String carId) {
        String query = "DELETE FROM car WHERE carId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, carId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Car deleted successfully!");
                return true;
            } else {
                System.out.println("Failed to delete car.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        return false;
    }
}

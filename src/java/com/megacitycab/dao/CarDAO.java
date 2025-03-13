package com.megacitycab.dao;

import com.megacitycab.util.DBConnection;
import com.megacitycab.model.Car;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    private static CarDAO instance; // Singleton instance
    private Connection connection;

    // Private constructor to prevent instantiation
    private CarDAO() {
        try {
            this.connection = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Public method to return the Singleton instance
    public static synchronized CarDAO getInstance() {
        if (instance == null) {
            instance = new CarDAO();
        }
        return instance;
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
            ps.setString(7, car.getAvailability());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
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
                        rs.getString("availability")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
                            rs.getString("availability")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
            ps.setString(6, car.getAvailability());
            ps.setString(7, car.getCarId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a car from the database
    public boolean deleteCar(String carId) {
        String query = "DELETE FROM car WHERE carId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, carId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

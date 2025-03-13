
package com.megacitycab.dao;

import com.megacitycab.util.DBConnection;
import com.megacitycab.model.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private static DriverDAO instance; // Singleton instance
    private Connection connection;

    // Private constructor to prevent instantiation
    private DriverDAO() {
        try {
            this.connection = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Public method to return the Singleton instance
    public static synchronized DriverDAO getInstance() {
        if (instance == null) {
            instance = new DriverDAO();
        }
        return instance;
    }

    // Add new driver to the database
    public boolean addDriver(Driver driver) {
        String query = "INSERT INTO driver (driverId, dName, licenseNo, contactNo) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getDriverId());
            ps.setString(2, driver.getDName());
            ps.setString(3, driver.getLicenseNo());
            ps.setString(4, driver.getContactNo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get a list of all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM driver";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                drivers.add(new Driver(
                        rs.getString("driverId"),
                        rs.getString("dName"),
                        rs.getString("licenseNo"),
                        rs.getString("contactNo")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // Get driver by driverId
    public Driver getDriverById(String driverId) {
        Driver driver = null;
        String query = "SELECT * FROM driver WHERE driverId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driverId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    driver = new Driver(
                            rs.getString("driverId"),
                            rs.getString("dName"),
                            rs.getString("licenseNo"),
                            rs.getString("contactNo")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return driver;
    }

    // Update an existing driver
    public boolean updateDriver(Driver driver) {
        String query = "UPDATE driver SET dName=?, licenseNo=?, contactNo=? WHERE driverId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getDName());
            ps.setString(2, driver.getLicenseNo());
            ps.setString(3, driver.getContactNo());
            ps.setString(4, driver.getDriverId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a driver from the database
    public boolean deleteDriver(String driverId) {
        String query = "DELETE FROM driver WHERE driverId=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driverId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

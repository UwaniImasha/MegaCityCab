package com.megacitycab.dao;

import com.megacitycab.util.DBConnection;
import com.megacitycab.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection connection;

    // Default constructor
    public BookingDAO() {
        try {
            this.connection = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
    }

    // Constructor with connection
    public BookingDAO(Connection con) {
        this.connection = con;
    }

    // Add a new booking to the database
    public boolean addBooking(Booking booking) {
        String query = "INSERT INTO booking (bookingNumber, customerId, driverId, carId, phone, pickupLocation, destination, dateTime, fare) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, booking.getBookingNumber());
            ps.setString(2, booking.getCustomerId());
            ps.setString(3, booking.getDriverId());
            ps.setString(4, booking.getCarId());
            ps.setString(5, booking.getPhone());
            ps.setString(6, booking.getPickupLocation());
            ps.setString(7, booking.getDestination());
            ps.setString(8, booking.getDateTime()); // store as String
            ps.setString(9, booking.getFare());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Booking added successfully!");
                return true;
            } else {
                System.out.println("Failed to add booking.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
            return false;
        }
    }

    // Get all bookings from the database
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                bookings.add(new Booking(
                        rs.getString("bookingNumber"),
                        rs.getString("customerId"),
                        rs.getString("driverId"),
                        rs.getString("carId"),
                        rs.getString("phone"),
                        rs.getString("pickupLocation"),
                        rs.getString("destination"),
                        rs.getString("dateTime"),  
                        rs.getString("fare")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        return bookings;
    }

    // Get a booking by bookingNumber
    public Booking getBookingByBookingNumber(String bookingNumber) {
        Booking booking = null;
        String query = "SELECT * FROM booking WHERE bookingNumber=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, bookingNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking(
                            rs.getString("bookingNumber"),
                            rs.getString("customerId"),
                            rs.getString("driverId"),
                            rs.getString("carId"),
                            rs.getString("phone"),
                            rs.getString("pickupLocation"),
                            rs.getString("destination"),
                            rs.getString("dateTime"),  
                            rs.getString("fare")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  
        }
        return booking;
    }

    // Update an existing booking
    public boolean updateBooking(Booking booking) {
    String query = "UPDATE booking SET customerId=?, driverId=?, carId=?, phone=?, pickupLocation=?, destination=?, dateTime=?, fare=? WHERE bookingNumber=?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, booking.getCustomerId());
        ps.setString(2, booking.getDriverId());
        ps.setString(3, booking.getCarId());
        ps.setString(4, booking.getPhone());
        ps.setString(5, booking.getPickupLocation());
        ps.setString(6, booking.getDestination());
        ps.setString(7, booking.getDateTime());
        ps.setString(8, booking.getFare());
        ps.setString(9, booking.getBookingNumber());

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}


    // Delete a booking from the database
    public boolean deleteBooking(String bookingNumber) {
        String query = "DELETE FROM booking WHERE bookingNumber=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, bookingNumber);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Booking deleted successfully!");
                return true;
            } else {
                System.out.println("Failed to delete booking.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log detailed errors here
        }
        return false;
    }
}
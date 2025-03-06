<<<<<<< Updated upstream
=======
package com.megacitycab.dao;

import com.megacitycab.model.Booking;
import com.megacitycab.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Add a booking
    public boolean addBooking(Booking booking) throws SQLException {
        String query = "INSERT INTO bookings (order_no, customer_reg_no, name, address, phone, destination, booking_time) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, booking.getOrderNo());
            pstmt.setString(2, booking.getCustomerRegNo());
            pstmt.setString(3, booking.getName());
            pstmt.setString(4, booking.getAddress());
            pstmt.setString(5, booking.getPhone());
            pstmt.setString(6, booking.getDestination());
            pstmt.setString(7, booking.getBookingTime());

            return pstmt.executeUpdate() > 0;
        }
    }

    // Update a booking
    public boolean updateBooking(Booking booking) throws SQLException {
        String query = "UPDATE bookings SET customer_reg_no=?, name=?, address=?, phone=?, destination=?, booking_time=? WHERE order_no=?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, booking.getCustomerRegNo());
            pstmt.setString(2, booking.getName());
            pstmt.setString(3, booking.getAddress());
            pstmt.setString(4, booking.getPhone());
            pstmt.setString(5, booking.getDestination());
            pstmt.setString(6, booking.getBookingTime());
            pstmt.setString(7, booking.getOrderNo());

            return pstmt.executeUpdate() > 0;
        }
    }

    // Delete a booking
    public boolean deleteBooking(String orderNo) throws SQLException {
        String query = "DELETE FROM bookings WHERE order_no=?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, orderNo);
            return pstmt.executeUpdate() > 0;
        }
    }

    // Fetch all bookings
    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM bookings";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getString("order_no"),
                        rs.getString("customer_reg_no"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("destination"),
                        rs.getString("booking_time")
                );
                bookings.add(booking);
            }
        }
        return bookings;
    }
}
>>>>>>> Stashed changes

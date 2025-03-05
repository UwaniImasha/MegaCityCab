package com.megacitycab.dao;

import com.megacitycab.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection conn;

    public BookingDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (orderNo, customerRegNo, name, address, phone, destination, bookingTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, booking.getOrderNo());
            ps.setString(2, booking.getCustomerRegNo());
            ps.setString(3, booking.getName());
            ps.setString(4, booking.getAddress());
            ps.setString(5, booking.getPhone());
            ps.setString(6, booking.getDestination());
            ps.setString(7, booking.getBookingTime());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setOrderNo(rs.getString("orderNo"));
                booking.setCustomerRegNo(rs.getString("customerRegNo"));
                booking.setName(rs.getString("name"));
                booking.setAddress(rs.getString("address"));
                booking.setPhone(rs.getString("phone"));
                booking.setDestination(rs.getString("destination"));
                booking.setBookingTime(rs.getString("bookingTime"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}

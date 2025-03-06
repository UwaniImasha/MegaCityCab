package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import com.megacitycab.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/pages/editBookingServlet")
public class EditBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve updated booking details
        String orderNo = request.getParameter("orderNo");
        String customerRegNo = request.getParameter("customerRegNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String destination = request.getParameter("destination");
        String bookingTime = request.getParameter("bookingTime");

        // Input validation
        if (orderNo == null || customerRegNo == null || name == null || address == null || phone == null || destination == null || bookingTime == null ||
            orderNo.isEmpty() || customerRegNo.isEmpty() || name.isEmpty() || address.isEmpty() || phone.isEmpty() || destination.isEmpty() || bookingTime.isEmpty()) {
            response.sendRedirect("editBooking.jsp?orderNo=" + orderNo + "&error=All fields are required!");
            return;
        }

        try {
            // Create a Booking object
            Booking booking = new Booking(orderNo, customerRegNo, name, address, phone, destination, bookingTime);
            
            // Create a DAO instance
            BookingDAO bookingDao = new BookingDAO();

            // Try to update the booking
            boolean success = bookingDao.updateBooking(booking);

            if (success) {
                response.sendRedirect("booking.jsp?success=Booking updated successfully!");
            } else {
                response.sendRedirect("editBooking.jsp?orderNo=" + orderNo + "&error=Failed to update booking.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("editBooking.jsp?orderNo=" + orderNo + "&error=" + e.getMessage());
        }
    }
}

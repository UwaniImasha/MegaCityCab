package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/pages/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNo = request.getParameter("orderNo");

        if (orderNo == null || orderNo.isEmpty()) {
            response.sendRedirect("booking.jsp?error=Invalid booking ID.");
            return;
        }

        try {
            // Create a DAO instance
            BookingDAO bookingDao = new BookingDAO();

            // Try to delete the booking
            boolean success = bookingDao.deleteBooking(orderNo);

            if (success) {
                response.sendRedirect("booking.jsp?success=Booking deleted successfully!");
            } else {
                response.sendRedirect("booking.jsp?error=Failed to delete booking.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=" + e.getMessage());
        }
    }
}

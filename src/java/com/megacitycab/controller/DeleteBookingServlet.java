package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/pages/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String bookingNumber = request.getParameter("bookingNumber");

        try {
            // Get the Singleton instance of BookingDAO
            BookingDAO bookingDao = BookingDAO.getInstance();
            
            // Delete the booking from the database
            boolean deleted = bookingDao.deleteBooking(bookingNumber);

            // Redirect based on the result of the delete operation
            if (deleted) {
                response.sendRedirect("booking.jsp?success=Booking deleted successfully");
            } else {
                response.sendRedirect("booking.jsp?error=Delete failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=Exception occurred");
        }
    }
}

package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import com.megacitycab.model.Booking;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/pages/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String bookingNumber = request.getParameter("bookingNumber");
        String customerId = request.getParameter("customerId");
        String driverId = request.getParameter("driverId");
        String carId = request.getParameter("carId");
        String phone = request.getParameter("phone");
        String pickupLocation = request.getParameter("pickupLocation");
        String destination = request.getParameter("destination");
        String dateTime = request.getParameter("dateTime");
        String fare = request.getParameter("fare");

        try {
            // Get the connection to the database
            Connection connection = DBConnection.getConnection();
            BookingDAO bookingDao = new BookingDAO(connection);

            // Create a Booking object with the data from the form
            Booking booking = new Booking(bookingNumber, customerId, driverId, carId, phone, pickupLocation, destination, dateTime, fare);

            // Update the booking in the database
            boolean updated = bookingDao.updateBooking(booking);

            // Redirect based on the result of the update operation
            if (updated) {
                response.sendRedirect("booking.jsp?success=Booking updated successfully");
            } else {
                response.sendRedirect("editBooking.jsp?error=Update failed&bookingNumber=" + bookingNumber);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editBooking.jsp?error=Exception occurred&bookingNumber=" + bookingNumber);
        }
    }
}

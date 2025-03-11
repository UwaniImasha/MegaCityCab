package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import com.megacitycab.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/addBookingServlet")
public class AddBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // Input validation
        if (bookingNumber == null || customerId == null || driverId == null || carId == null || phone == null || 
            pickupLocation == null || destination == null || dateTime == null || fare == null || 
            bookingNumber.isEmpty() || customerId.isEmpty() || driverId.isEmpty() || carId.isEmpty() || 
            phone.isEmpty() || pickupLocation.isEmpty() || destination.isEmpty() || dateTime.isEmpty() || fare.isEmpty()) {
            response.sendRedirect("addBooking.jsp?error=" + URLEncoder.encode("All fields are required!", "UTF-8"));
            return;
        }

        try {
            // Create a new booking object
            Booking booking = new Booking(bookingNumber, customerId, driverId, carId, phone, pickupLocation, destination, dateTime, fare);
            
            // Get the Singleton instance of BookingDAO
            BookingDAO bookingDao = BookingDAO.getInstance();

            // Try to add the booking
            boolean success = bookingDao.addBooking(booking);

            // Redirect to booking.jsp after successful addition
            if (success) {
                response.sendRedirect("pages/booking.jsp?success=" + URLEncoder.encode("Booking added successfully!", "UTF-8"));
            } else {
                response.sendRedirect("addBooking.jsp?error=" + URLEncoder.encode("Failed to add booking.", "UTF-8"));
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the operation
            e.printStackTrace();
            response.sendRedirect("addBooking.jsp?error=" + URLEncoder.encode("Exception: " + e.getMessage(), "UTF-8"));
        }
    }
}

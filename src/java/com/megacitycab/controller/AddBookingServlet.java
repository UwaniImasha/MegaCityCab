package com.megacitycab.controller;

import com.megacitycab.dao.BookingDAO;
import com.megacitycab.model.Booking;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/addBookingServlet")
public class AddBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNo = request.getParameter("orderNo");
        String customerRegNo = request.getParameter("customerRegNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String destination = request.getParameter("destination");
        String bookingTime = request.getParameter("bookingTime");

        // Create booking object
        Booking booking = new Booking();
        booking.setOrderNo(orderNo);
        booking.setCustomerRegNo(customerRegNo);
        booking.setName(name);
        booking.setAddress(address);
        booking.setPhone(phone);
        booking.setDestination(destination);
        booking.setBookingTime(bookingTime);

        // Initialize connection variable
        Connection conn = null;
        try {
            // Establish connection
            conn = DBConnection.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AddBookingServlet.class.getName()).log(Level.SEVERE, "Error connecting to the database", ex);
            // Handle error (e.g., redirect to error page)
            response.sendRedirect("error.jsp");  // Optionally redirect to an error page
            return;
        }

        // Use the connection to perform the database operation
        BookingDAO bookingDAO = new BookingDAO(conn);
        boolean success = bookingDAO.addBooking(booking);

        if (success) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("addBooking.jsp?error=1");
        }
    }
}

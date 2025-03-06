<<<<<<< Updated upstream
=======
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

@WebServlet("/addBookingServlet")
public class AddBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNo = request.getParameter("orderNo");
        String customerRegNo = request.getParameter("customerRegNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String destination = request.getParameter("destination");
        String bookingTime = request.getParameter("bookingTime");

        if (orderNo.isEmpty() || customerRegNo.isEmpty() || name.isEmpty() || address.isEmpty() || phone.isEmpty() || destination.isEmpty() || bookingTime.isEmpty()) {
            response.sendRedirect("addBooking.jsp?error=All fields are required!");
            return;
        }

        Booking booking = new Booking(orderNo, customerRegNo, name, address, phone, destination, bookingTime);
        BookingDAO bookingDao = new BookingDAO();

        try {
            if (bookingDao.addBooking(booking)) {
                response.sendRedirect("pages/booking.jsp?success=true");
            } else {
                response.sendRedirect("addBooking.jsp?error=Failed to add booking.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addBooking.jsp?error=Database error.");
        }
    }
}
>>>>>>> Stashed changes

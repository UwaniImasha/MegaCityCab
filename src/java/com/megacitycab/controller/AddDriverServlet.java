package com.megacitycab.controller;

import com.megacitycab.dao.DriverDAO;
import com.megacitycab.model.Driver;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addDriverServlet")
public class AddDriverServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String driverId = request.getParameter("driverId");
        String dName = request.getParameter("dName");
        String license = request.getParameter("license");
        String contact = request.getParameter("contact");

        // Input validation
        if (driverId == null || dName == null || license == null || contact == null ||
            driverId.isEmpty() || dName.isEmpty() || license.isEmpty() || contact.isEmpty()) {
            response.sendRedirect("addDrivers.jsp?error=All fields are required!");
            return;
        }

        // Optionally add format validation (for contact number and license, etc.)
        // Example: validate phone number format
        if (!contact.matches("\\d{10}")) {  // assuming contact should be a 10-digit number
            response.sendRedirect("addDrivers.jsp?error=Invalid contact number.");
            return;
        }

        try {
            // Create a new driver object
            Driver driver = new Driver(driverId, dName, license, contact);
            
            // Create a DAO instance to interact with the database
            DriverDAO driverDao = new DriverDAO();

            // Try to add the driver
            boolean success = driverDao.addDriver(driver);

            // Redirect to drivers.jsp after successful addition
            if (success) {
                response.sendRedirect("pages/driver.jsp?success=true");
            } else {
                response.sendRedirect("addDrivers.jsp?error=Failed to add driver.");
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the operation
            e.printStackTrace();
            response.sendRedirect("addDrivers.jsp?error=" + e.getMessage());
        }
    }
}

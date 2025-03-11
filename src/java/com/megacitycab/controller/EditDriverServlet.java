package com.megacitycab.controller;

import com.megacitycab.dao.DriverDAO;
import com.megacitycab.model.Driver;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/pages/EditDriverServlet")
public class EditDriverServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("driverId");
        String dName = request.getParameter("driverName");  
        String licenseNo = request.getParameter("driverLicense");  
        String contactNo = request.getParameter("driverPhone");

        // Validate the inputs
        if (driverId == null || dName == null || licenseNo == null || contactNo == null ||
            driverId.isEmpty() || dName.isEmpty() || licenseNo.isEmpty() || contactNo.isEmpty()) {
            response.sendRedirect("editDriver.jsp?driverId=" + driverId + "&error=All fields are required!");
            return;
        }

        try {
           
            Driver driver = new Driver(driverId, dName, licenseNo, contactNo);  

            
            DriverDAO driverDao = DriverDAO.getInstance();
            boolean isUpdated = driverDao.updateDriver(driver);

            
            if (isUpdated) {
                response.sendRedirect("driver.jsp?driverId=" + driverId + "&success=true"); // Or to a driver list page
            } else {
                response.sendRedirect("editDriver.jsp?driverId=" + driverId + "&error=Failed to update driver.");
            }
        } catch (Exception e) {
            // Log the error and redirect
            e.printStackTrace();
            response.sendRedirect("editDriver.jsp?driverId=" + driverId + "&error=" + e.getMessage());
        }
    }
}


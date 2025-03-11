package com.megacitycab.controller;

import com.megacitycab.dao.DriverDAO;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/pages/DeleteDriverServlet")
public class DeleteDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String driverId = request.getParameter("driverId");  

        try {
            Connection connection = DBConnection.getConnection();
            DriverDAO driverDao = DriverDAO.getInstance();
            
            boolean deleted = driverDao.deleteDriver(driverId);

            if (deleted) {
                response.sendRedirect("driver.jsp?success=Driver deleted successfully");
            } else {
                response.sendRedirect("driver.jsp?error=Delete failed&driverId=" + driverId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("driver.jsp?error=Exception occurred&driverId=" + driverId);
        }
    }
}

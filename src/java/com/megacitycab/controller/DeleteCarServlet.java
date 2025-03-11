package com.megacitycab.controller;

import com.megacitycab.dao.CarDAO;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/pages/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String carId = request.getParameter("carId");  

        try {
            Connection connection = DBConnection.getConnection();
            CarDAO carDao = CarDAO.getInstance();

            
            boolean deleted = carDao.deleteCar(carId);

            if (deleted) {
                response.sendRedirect("car.jsp?success=Car deleted successfully");
            } else {
                response.sendRedirect("car.jsp?error=Delete failed&carId=" + carId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("car.jsp?error=Exception occurred&carId=" + carId);
        }
    }
}

package com.megacitycab.controller;

import com.megacitycab.dao.CustomerDAO;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/pages/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String customerId = request.getParameter("customerId");

        try {
            Connection connection = DBConnection.getConnection();
            CustomerDAO customerDao = new CustomerDAO(connection);
            
            boolean deleted = customerDao.deleteCustomer(customerId);

            if (deleted) {
                response.sendRedirect("customers.jsp?success=Customer deleted successfully");
            } else {
                response.sendRedirect("customers.jsp?error=Delete failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customers.jsp?error=Exception occurred");
        }
    }
}

package com.megacitycab.controller;

import com.megacitycab.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/pages/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String customerId = request.getParameter("customerId");

        try {
            // Use the Singleton instance of CustomerDAO
            CustomerDAO customerDao = CustomerDAO.getInstance();  // Get the singleton instance
            
            // Delete the customer
            boolean deleted = customerDao.deleteCustomer(customerId);

            // Redirect based on whether the deletion was successful or not
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

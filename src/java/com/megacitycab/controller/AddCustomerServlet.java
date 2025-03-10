package com.megacitycab.controller;

import com.megacitycab.dao.CustomerDAO;
import com.megacitycab.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String customerId = request.getParameter("customerId");
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        String customerPhone = request.getParameter("customerPhone");

        // Input validation
        if (customerId == null || customerName == null || customerAddress == null || customerPhone == null ||
            customerId.isEmpty() || customerName.isEmpty() || customerAddress.isEmpty() || customerPhone.isEmpty()) {
            response.sendRedirect("addCustomers.jsp?error=All fields are required!");
            return;
        }

        try {
            // Create a new customer object
            Customer customer = new Customer(customerId, customerName, customerAddress, customerPhone);
            
            // Get the singleton instance of CustomerDAO
            CustomerDAO customerDao = CustomerDAO.getInstance();

            // Try to add the customer
            boolean success = customerDao.addCustomer(customer);

            // Redirect to customer.jsp after successful addition
            if (success) {
                response.sendRedirect("pages/customers.jsp?success=true");
            } else {
                response.sendRedirect("addCustomers.jsp?error=Failed to add customer.");
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the operation
            e.printStackTrace();
            response.sendRedirect("addCustomers.jsp?error=" + e.getMessage());
        }
    }
}

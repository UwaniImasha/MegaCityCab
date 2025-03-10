package com.megacitycab.controller;

import com.megacitycab.dao.CustomerDAO;
import com.megacitycab.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/pages/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String customerId = request.getParameter("customerId");  
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        String customerPhone = request.getParameter("customerPhone");

        try {
            // Use the Singleton instance of CustomerDAO
            CustomerDAO customerDao = CustomerDAO.getInstance();  // Get the singleton instance

            // Create a customer object with the updated information
            Customer customer = new Customer(customerId, customerName, customerAddress, customerPhone);  
            
            // Update the customer
            boolean updated = customerDao.updateCustomer(customer);

            // Redirect based on whether the update was successful or not
            if (updated) {
                response.sendRedirect("customers.jsp?success=Customer updated successfully");
            } else {
                response.sendRedirect("editCustomer.jsp?error=Update failed&customerId=" + customerId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editCustomer.jsp?error=Exception occurred&customerId=" + customerId);
        }
    }
}

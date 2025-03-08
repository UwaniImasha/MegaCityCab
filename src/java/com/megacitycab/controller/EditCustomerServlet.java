package com.megacitycab.controller;

import com.megacitycab.dao.CustomerDAO;
import com.megacitycab.model.Customer;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;


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
            Connection connection = DBConnection.getConnection();
            CustomerDAO customerDao = new CustomerDAO(connection);
            
            Customer customer = new Customer(customerId, customerName, customerAddress, customerPhone);  
            boolean updated = customerDao.updateCustomer(customer);

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



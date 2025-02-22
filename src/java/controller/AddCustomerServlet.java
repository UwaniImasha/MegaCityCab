/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author Uwani Imasha
 */

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String cudID = request.getParameter("cudID");
        String phone = request.getParameter("phone");

        Customer customer = new Customer(name, address, nic, cudID);
        /*boolean isAdded = CustomerDAO.addCustomer(customer);

        if (isAdded) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("addCustomers.jsp?error=1");
        }*/
    }
}
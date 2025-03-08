package com.megacitycab.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/processBillServlet")
public class ProcessBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters
        String bookingNumber = request.getParameter("bookingNumber");
        String fareStr = request.getParameter("fare");
        String discountStr = request.getParameter("discount");
        String taxesStr = request.getParameter("taxes");

        // Convert to double, handling null values
        double originalFare = (fareStr != null && !fareStr.isEmpty()) ? Double.parseDouble(fareStr) : 0.0;
        double discountPercent = (discountStr != null && !discountStr.isEmpty()) ? Double.parseDouble(discountStr) : 0.0;
        double taxPercent = (taxesStr != null && !taxesStr.isEmpty()) ? Double.parseDouble(taxesStr) : 0.0;

        // Calculate amounts
        double discountAmount = originalFare * (discountPercent / 100);
        double taxAmount = originalFare * (taxPercent / 100);
        double finalBill = originalFare - discountAmount + taxAmount;

        // Set attributes to pass to displayBill.jsp
        request.setAttribute("bookingNumber", bookingNumber);
        request.setAttribute("originalFare", String.format("%.2f", originalFare)); // Rs. 100.00 format
        request.setAttribute("discountAmount", String.format("%.2f", discountAmount));
        request.setAttribute("taxAmount", String.format("%.2f", taxAmount));
        request.setAttribute("finalBill", String.format("%.2f", finalBill));

        // Forward request to displayBill.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/displayBill.jsp");
        dispatcher.forward(request, response);
    }
}

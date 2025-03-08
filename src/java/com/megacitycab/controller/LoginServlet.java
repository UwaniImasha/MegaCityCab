package com.megacitycab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Hardcoded credentials (for testing purposes)
    private static final String HARD_CODED_USERNAME = "admin";
    private static final String HARD_CODED_PASSWORD = "admin123";  // This should be hashed for security in production

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if the username and password match the hardcoded values
        if (HARD_CODED_USERNAME.equals(username) && HARD_CODED_PASSWORD.equals(password)) {
            // Authentication successful, create a session for the admin
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);

            // Redirect to the admin dashboard after successful login
            response.sendRedirect("dashboard.jsp");
        } else {
            // Authentication failed, redirect to login page with an error message
            response.sendRedirect("login.jsp?error=true");
        }
    }
}

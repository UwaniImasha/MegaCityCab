package com.megacitycab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.megacitycab.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            // Query to check credentials
            String sql = "SELECT username FROM users WHERE username=? AND password=?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // User credentials are valid, store username in session
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);

                        // Redirect to dashboard
                        response.sendRedirect("pages/dashboard.jsp");
                    } else {
                        // Invalid credentials, show error on the same page
                        request.setAttribute("error", "Invalid username or password.");
                        request.getRequestDispatcher("login.jsp").include(request, response); // Show error message in the same page
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").include(request, response); // Show error message in the same page
        }
    }
}

package com.megacitycab.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3030/megacitycab"; // Use your correct port
    private static final String USER = "root";  // Database username
    private static final String PASSWORD = "Uwani@123";  // Database password

    // Method to get the database connection ----> (Singleton)
    public static Connection getConnection() throws SQLException {
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Return a connection to the database using the constants
            return DriverManager.getConnection("jdbc:mysql://localhost:3030/megacitycab", "root", "Uwani@123");
        } catch (ClassNotFoundException e) {
            // Handle error if JDBC driver is not found
            throw new SQLException("JDBC Driver not found. Please check the MySQL driver dependency.", e);
        } catch (SQLException e) {
            // Additional logging can be helpful for debugging SQLExceptions
            throw new SQLException("Error while establishing the database connection.", e);
        }
    }
}

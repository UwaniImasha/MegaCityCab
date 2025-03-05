package com.megacitycab.dao;

import com.megacitycab.util.DBConnection;
import com.megacitycab.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    private Connection connection;

    // Default constructor
    public CustomerDAO() {
        try {
            this.connection = DBConnection.getConnection(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Constructor with connection
    public CustomerDAO(Connection con) {
        this.connection = con;
    }

    // Add new customer to the database
    public boolean addCustomer(Customer customer) {
        try {
            String query = "INSERT INTO customers (customerId, customerName, customerAddress, customerPhone) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, customer.getCustomerId());
            ps.setString(2, customer.getCustomerName());
            ps.setString(3, customer.getCustomerAddress());
            ps.setString(4, customer.getCustomerPhone());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get a list of all customers
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try {
            String query = "SELECT * FROM customers";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                customers.add(new Customer(
                    rs.getString("customerId"),
                    rs.getString("customerName"),
                    rs.getString("customerAddress"),
                    rs.getString("customerPhone")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    // Get customer by their customerId
    public Customer getCustomerById(String customerId) {
        Customer customer = null;
        try {
            String query = "SELECT * FROM customers WHERE customerId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                    rs.getString("customerId"),
                    rs.getString("customerName"),
                    rs.getString("customerAddress"),
                    rs.getString("customerPhone")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    // Update an existing customer
    public boolean updateCustomer(Customer customer) {
        try {
            String query = "UPDATE customers SET customerName=?, customerAddress=?, customerPhone=? WHERE customerId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getCustomerAddress());
            ps.setString(3, customer.getCustomerPhone());
            ps.setString(4, customer.getCustomerId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a customer from the database
    public boolean deleteCustomer(String customerId) {
        try {
            String query = "DELETE FROM customers WHERE customerId=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, customerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

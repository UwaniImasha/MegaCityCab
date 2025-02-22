/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import model.Customer;
import dao.CustomerDAO;

/**
 *
 * @author Uwani Imasha
 */
public class CustomerService {
    private CustomerDAO customerDAO = new CustomerDAO();

    // Add a new customer
    public boolean addCustomer(Customer customer) {
        if (customer.getName() == null || customer.getPhone().isEmpty()) {
            return false; // Basic validation
        }
        return customerDAO.addCustomer(customer);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Uwani Imasha
 */
public class Customer {
    private int cudID;
    private String name;
    private String address;
    private String email;
    private String nic;
    private String phone;

    public Customer(String name, String address, String email, String nic) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.nic = nic;
        this.phone = phone;
    }
    
  

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}

    

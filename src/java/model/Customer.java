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
    private int id;
    private String name;
    private String address;
    private String nic;
    private String phone;

    public Customer(String name, String address, String nic, String phone) {
        this.name = name;
        this.address = address;
        this.nic = nic;
        this.phone = phone;
    }
    
}

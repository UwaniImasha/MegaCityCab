package com.megacitycab.dao;

import com.megacitycab.model.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BillDAO {
    private Connection conn;

    // Constructor to initialize DB connection
    public BillDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to insert bill into the database
    public void saveBill(Bill bill) throws SQLException {
        String sql = "INSERT INTO Bill (booking_number, original_fare, discount_amount, tax_amount, final_bill) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        
        stmt.setString(1, bill.getBookingNumber());
        stmt.setDouble(2, bill.getOriginalFare());
        stmt.setDouble(3, bill.getDiscountAmount());
        stmt.setDouble(4, bill.getTaxAmount());
        stmt.setDouble(5, bill.getFinalBill());

        stmt.executeUpdate();
        stmt.close();
    }
}

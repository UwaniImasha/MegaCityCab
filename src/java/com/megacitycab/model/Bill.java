package com.megacitycab.model;

public class Bill {
    private int billId;
    private String bookingNumber;
    private double originalFare;
    private double discountAmount;
    private double taxAmount;
    private double finalBill;

    // Constructor
    public Bill(String bookingNumber, double originalFare, double discountAmount, double taxAmount, double finalBill) {
        this.bookingNumber = bookingNumber;
        this.originalFare = originalFare;
        this.discountAmount = discountAmount;
        this.taxAmount = taxAmount;
        this.finalBill = finalBill;
    }

    // Getters and Setters
    public int getBillId() { 
        return billId; 
    }
    public void setBillId(int billId) { 
        this.billId = billId; 
    }

    public String getBookingNumber() { 
        return bookingNumber; 
    }
    public void setBookingNumber(String bookingNumber) { 
        this.bookingNumber = bookingNumber; 
    }

    public double getOriginalFare() { 
        return originalFare; 
    }
    public double getDiscountAmount() { 
        return discountAmount; 
    }
    public double getTaxAmount() { 
        return taxAmount; 
    }
    public double getFinalBill() { 
        return finalBill; 
    }
}

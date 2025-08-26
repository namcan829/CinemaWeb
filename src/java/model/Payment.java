/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author NgoQuan
 */
public class Payment {
    private int paymentId;
    private int bookingId;
    private int methodId;
    private Date paymentDate;
    private double amount;
    private int statusId;

    public Payment() {
    }

    public Payment(int paymentId, int bookingId, int methodId, Date paymentDate, double amount, int statusId) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.methodId = methodId;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.statusId = statusId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getMethodId() {
        return methodId;
    }

    public void setMethodId(int methodId) {
        this.methodId = methodId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
}

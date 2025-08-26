/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NgoQuan
 */
public class BookingSeat {
    private int bookingSeatId;
    private int bookingId;
    private int seatId;
    private double price;

    public BookingSeat() {
    }

    public BookingSeat(int bookingSeatId, int bookingId, int seatId, double price) {
        this.bookingSeatId = bookingSeatId;
        this.bookingId = bookingId;
        this.seatId = seatId;
        this.price = price;
    }

    public int getBookingSeatId() {
        return bookingSeatId;
    }

    public void setBookingSeatId(int bookingSeatId) {
        this.bookingSeatId = bookingSeatId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}

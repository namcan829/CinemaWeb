/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NgoQuan
 */
public class Seats {
    private int seatId;
    private int hallId;
    private char seatRow;
    private int seatNumber;
    private int typeId;
    private int statusId;

    public Seats() {
    }

    public Seats(int seatId, int hallId, char seatRow, int seatNumber, int typeId, int statusId) {
        this.seatId = seatId;
        this.hallId = hallId;
        this.seatRow = seatRow;
        this.seatNumber = seatNumber;
        this.typeId = typeId;
        this.statusId = statusId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public int getHallId() {
        return hallId;
    }

    public void setHallId(int hallId) {
        this.hallId = hallId;
    }

    public char getSeatRow() {
        return seatRow;
    }

    public void setSeatRow(char seatRow) {
        this.seatRow = seatRow;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
}

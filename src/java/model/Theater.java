/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NgoQuan
 */
public class Theater {
    private int theaterId;
    private String name;
    private String location;
    private int totalHalls;
    private int statusId;

    public Theater() {
    }

    public Theater(int theaterId, String name, String location, int totalHalls, int statusId) {
        this.theaterId = theaterId;
        this.name = name;
        this.location = location;
        this.totalHalls = totalHalls;
        this.statusId = statusId;
    }

    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getTotalHalls() {
        return totalHalls;
    }

    public void setTotalHalls(int totalHalls) {
        this.totalHalls = totalHalls;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Theater{");
        sb.append("theaterId=").append(theaterId);
        sb.append(", name=").append(name);
        sb.append(", location=").append(location);
        sb.append(", totalHalls=").append(totalHalls);
        sb.append(", statusId=").append(statusId);
        sb.append('}');
        return sb.toString();
    }
    
}

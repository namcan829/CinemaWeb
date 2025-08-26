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
public class Movies {

    private int movieId;
    private String title;
    private String description;
    private int duration;
    private int year;
    private Date releaseDate;
    private float rating;
    private String imageUrl;
    private int statusId;
    private String categories;

    public Movies() {
    }

    public Movies(int movieId, String title, String description, int duration, int year, Date releaseDate, float rating, String imageUrl, int statusId) {
        this.movieId = movieId;
        this.title = title;
        this.description = description;
        this.duration = duration;
        this.year = year;
        this.releaseDate = releaseDate;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.statusId = statusId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Movies{");
        sb.append("movieId=").append(movieId);
        sb.append(", title=").append(title);
        sb.append(", description=").append(description);
        sb.append(", duration=").append(duration);
        sb.append(", year=").append(year);
        sb.append(", releaseDate=").append(releaseDate);
        sb.append(", rating=").append(rating);
        sb.append(", imageUrl=").append(imageUrl);
        sb.append(", statusId=").append(statusId);
        sb.append(", categories=").append(categories);
        sb.append('}');
        return sb.toString();
    }

    
}

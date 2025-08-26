/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NgoQuan
 */
public class MovieCategoryMapping {
     private int movieId;
    private int categoryId;

    public MovieCategoryMapping() {
    }

    public MovieCategoryMapping(int movieId, int categoryId) {
        this.movieId = movieId;
        this.categoryId = categoryId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
}

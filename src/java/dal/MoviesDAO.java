/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Movies;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author NgoQuan
 */
public class MoviesDAO extends DBContext {

    private Movies movie(ResultSet rs) {
        try {
            return new Movies(
                    rs.getInt("movie_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("duration"),
                    rs.getInt("year"),
                    rs.getDate("release_date"),
                    rs.getFloat("rating"),
                    rs.getString("image_url"),
                    rs.getInt("status_id")
            );
        } catch (SQLException e) {
            System.out.println("Error mapping ResultSet to Movie");
        }
        return null;
    }

    public List<Movies> getMoviesByCategory(String categoryId) {
        List<Movies> movies = new ArrayList<>();
        String sql = "SELECT m.* FROM Movies m "
                + "JOIN Movie_Category mc ON m.movie_id = mc.movie_id "
                + "JOIN MovieCategories c ON mc.category_id = c.category_id "
                + "WHERE c.category_id = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, categoryId); 
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                movies.add(movie(rs)); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movies;
    }

    public List<Movies> searchMoviesByTitle(String query) {
        List<Movies> movies = new ArrayList<>();
        String sql = "SELECT * FROM Movies WHERE title LIKE ? ORDER BY Year DESC";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, "%" + query + "%");
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {

                movies.add(movie(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movies;
    }

    public int addMovie(String title, String description, int duration, int year, Date releaseDate, float rating, String imageUrl, int statusId) {
        String sql = "INSERT INTO Movies (title, description, duration, year, release_date, rating, image_url, status_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, duration);
            ps.setInt(4, year);
            ps.setDate(5, releaseDate);
            ps.setFloat(6, rating);
            ps.setString(7, imageUrl);
            ps.setInt(8, statusId);

            int affectedRows = ps.executeUpdate();
            System.out.println("Affected rows: " + affectedRows);
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int newMovieId = rs.getInt(1);
                    System.out.println("New Movie ID: " + newMovieId);
                    return newMovieId;
                } else {
                    System.out.println("No generated key returned!");
                }
            } else {
                System.out.println("Movie insert failed!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu thất bại
    }

    public boolean addMovieCategory(int movieId, int categoryId) {
        String sql = "INSERT INTO Movie_Category (movie_id, category_id) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setInt(2, categoryId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Movies> getAllMoviesCate() {
        List<Movies> list = new ArrayList<>();
        String sql = "SELECT m.*, STRING_AGG(mc.category_name, ', ') AS categories "
                + "FROM Movies m "
                + "LEFT JOIN Movie_Category mc_link ON m.movie_id = mc_link.movie_id "
                + "LEFT JOIN MovieCategories mc ON mc_link.category_id = mc.category_id "
                + "GROUP BY m.movie_id, m.title, m.description, m.duration, m.year, "
                + "m.release_date, m.rating, m.image_url, m.status_id";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Movies movie = new Movies(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("duration"),
                        rs.getInt("year"),
                        rs.getDate("release_date"),
                        rs.getFloat("rating"),
                        rs.getString("image_url"),
                        rs.getInt("status_id")
                );

                movie.setCategories(rs.getString("categories"));

                list.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteMovie(int movieId) {
        String deleteCategorySQL = "DELETE FROM Movie_Category WHERE movie_id = ?";
        String deleteMovieSQL = "DELETE FROM Movies WHERE movie_id = ?";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            PreparedStatement ps1 = connection.prepareStatement(deleteCategorySQL);
            ps1.setInt(1, movieId);
            ps1.executeUpdate();

            PreparedStatement ps2 = connection.prepareStatement(deleteMovieSQL);
            ps2.setInt(1, movieId);
            int affectedRows = ps2.executeUpdate();

            if (affectedRows > 0) {
                connection.commit();
                return true;
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateMovie(int movieId, String title, String description, int duration, int year,
            Date releaseDate, float rating, String imageUrl, String categoryId) {
        // Cập nhật thông tin phim
        String sql = "UPDATE Movies SET title = ?, description = ?, duration = ?, year = ?, "
                + "release_date = ?, rating = ?, image_url = ? WHERE movie_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, duration);
            ps.setInt(4, year);
            ps.setDate(5, releaseDate);
            ps.setFloat(6, rating);
            ps.setString(7, imageUrl);
            ps.setInt(8, movieId);

            int rowsAffected = ps.executeUpdate();

            // Nếu có sự thay đổi ở Movie, tiếp tục xử lý thể loại
            if (rowsAffected > 0) {
                // Xóa thể loại cũ của bộ phim
                String deleteSql = "DELETE FROM Movie_Category WHERE movie_id = ?";
                try (PreparedStatement deletePs = connection.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, movieId);
                    deletePs.executeUpdate();
                }

                // Thêm thể loại mới vào Movie_Category
                String insertSql = "INSERT INTO Movie_Category (movie_id, category_id) VALUES (?, ?)";
                try (PreparedStatement insertPs = connection.prepareStatement(insertSql)) {
                    insertPs.setInt(1, movieId);
                    insertPs.setInt(2, Integer.parseInt(categoryId)); // ID thể loại
                    insertPs.executeUpdate(); // Thực thi thêm thể loại mới
                }

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Movies getMovieById(int movieId) {
        Movies movie = null;
        String sql = "SELECT m.*, STRING_AGG(mc.category_id, ',') AS category_ids "
                + "FROM Movies m "
                + "LEFT JOIN Movie_Category mc_link ON m.movie_id = mc_link.movie_id "
                + "LEFT JOIN MovieCategories mc ON mc_link.category_id = mc.category_id "
                + "WHERE m.movie_id = ? "
                + "GROUP BY m.movie_id, m.title, m.description, m.duration, m.year, "
                + "m.release_date, m.rating, m.image_url, m.status_id";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                movie = new Movies(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("duration"),
                        rs.getInt("year"),
                        rs.getDate("release_date"),
                        rs.getFloat("rating"),
                        rs.getString("image_url"),
                        rs.getInt("status_id")
                );
                movie.setCategories(rs.getString("category_ids"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }

    public List<Movies> getAllMovies() {
        List<Movies> list = new ArrayList<>();
        String sql = "select * from Movies";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(movie(rs));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Movies> getAllMoviesShowing() {
        List<Movies> list = new ArrayList<>();
        String sql = "SELECT m.*, STRING_AGG(mc.category_name, ', ') AS categories "
                + "FROM Movies m "
                + "LEFT JOIN Movie_Category mc_link ON m.movie_id = mc_link.movie_id "
                + "LEFT JOIN MovieCategories mc ON mc_link.category_id = mc.category_id "
                + "WHERE m.status_id = 1 "
                + "GROUP BY m.movie_id, m.title, m.description, m.duration, m.year, "
                + "m.release_date, m.rating, m.image_url, m.status_id";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Movies movie = new Movies(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("duration"),
                        rs.getInt("year"),
                        rs.getDate("release_date"),
                        rs.getFloat("rating"),
                        rs.getString("image_url"),
                        rs.getInt("status_id")
                );
                movie.setCategories(rs.getString("categories")); // Thêm danh sách thể loại
                list.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Movies> getAllMoviesComming() {
        List<Movies> list = new ArrayList<>();
        String sql = "SELECT m.*, STRING_AGG(mc.category_name, ', ') AS categories "
                + "FROM Movies m "
                + "LEFT JOIN Movie_Category mc_link ON m.movie_id = mc_link.movie_id "
                + "LEFT JOIN MovieCategories mc ON mc_link.category_id = mc.category_id "
                + "WHERE m.status_id = 2 "
                + "GROUP BY m.movie_id, m.title, m.description, m.duration, m.year, "
                + "m.release_date, m.rating, m.image_url, m.status_id";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Movies movie = new Movies(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("duration"),
                        rs.getInt("year"),
                        rs.getDate("release_date"),
                        rs.getFloat("rating"),
                        rs.getString("image_url"),
                        rs.getInt("status_id")
                );
                movie.setCategories(rs.getString("categories")); // Thêm danh sách thể loại
                list.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Movies> getAllMoviesCancelled() {
        List<Movies> list = new ArrayList<>();
        String sql = "SELECT m.*, STRING_AGG(mc.category_name, ', ') AS categories "
                + "FROM Movies m "
                + "LEFT JOIN Movie_Category mc_link ON m.movie_id = mc_link.movie_id "
                + "LEFT JOIN MovieCategories mc ON mc_link.category_id = mc.category_id "
                + "WHERE m.status_id = 3 "
                + "GROUP BY m.movie_id, m.title, m.description, m.duration, m.year, "
                + "m.release_date, m.rating, m.image_url, m.status_id";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Movies movie = new Movies(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("duration"),
                        rs.getInt("year"),
                        rs.getDate("release_date"),
                        rs.getFloat("rating"),
                        rs.getString("image_url"),
                        rs.getInt("status_id")
                );
                movie.setCategories(rs.getString("categories")); // Thêm danh sách thể loại
                list.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}

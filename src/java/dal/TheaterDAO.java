/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Showtimes;
import model.Theater;

/**
 *
 * @author NgoQuan
 */
public class TheaterDAO extends DBContext {

    public List<Theater> getAllTheaters() {
        List<Theater> theaters = new ArrayList<>();
        String sql = "select * from Theaters";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            // Execute the query
            ResultSet rs = pre.executeQuery();

            // Process the result set
            while (rs.next()) {
                Theater theater = new Theater();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theater.setLocation(rs.getString("location"));
                theater.setTotalHalls(rs.getInt("total_halls"));
                theater.setStatusId(rs.getInt("status_id"));
                theaters.add(theater);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return theaters;
    }

    public List<Showtimes> getShowtimesByMovie() {
        List<Showtimes> showtimes = new ArrayList<>();
        String sql = "SELECT showtime_id, movie_id, hall_id, show_date, start_time, end_time, price "
                + "FROM Showtimes "
                + "ORDER BY movie_id, show_date, start_time";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            // Execute the query
            ResultSet rs = pre.executeQuery();

            // Process the result set
            while (rs.next()) {
                Showtimes showtime = new Showtimes();
                showtime.setShowtimeId(rs.getInt("showtime_id"));
                showtime.setMovieId(rs.getInt("movie_id"));
                showtime.setHallId(rs.getInt("hall_id"));
                showtime.setShowDate(rs.getDate("show_date"));
                showtime.setStartTime(rs.getString("start_time"));
                showtime.setEndTime(rs.getString("end_time"));
                showtime.setPrice(rs.getDouble("price"));
                showtimes.add(showtime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return showtimes;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MovieCategory;

/**
 *
 * @author NgoQuan
 */
public class MovieCategoryDAO extends DBContext {

    public List<MovieCategory> getAllCate() {
        List<MovieCategory> list = new ArrayList<>();
        String sql = "SELECT category_id, category_name FROM MovieCategories";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("category_name");
                list.add(new MovieCategory(id, name));
            }
        } catch (SQLException e) {
        }
        return list;
    }

}

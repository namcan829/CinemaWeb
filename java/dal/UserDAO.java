
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Users;


public class UserDAO extends DBContext {

    private Users user(ResultSet rs) {
        try {
            return new Users(
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("full_name"),
                    rs.getInt("gender"),
                    rs.getDate("birthdate"),
                    rs.getString("phone"),
                    rs.getInt("role_id"),
                    rs.getTimestamp("created_at") != null
                    ? rs.getTimestamp("created_at").toLocalDateTime() : null,
                    rs.getInt("created_by"),
                    rs.getInt("update_by"),
                    rs.getTimestamp("update_at") != null
                    ? rs.getTimestamp("update_at").toLocalDateTime() : null,
                    rs.getInt("status_id")
            );
        } catch (SQLException e) {
            System.out.println("Error mapping ResultSet to User");
        }
        return null;
    }

    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Users user = user(rs);
                if (user != null) { 
                    list.add(user);
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean insertUser(String username, String password, String email, String fullName, int gender, Date birthdate, String phone, int roleId, int creatorRole) {
        String sql = "INSERT INTO Users (username, password, email, full_name, gender, birthdate, phone, role_id, created_at, created_by, update_by, update_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), ?, NULL, NULL)";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, username);
            pre.setString(2, password);
            pre.setString(3, email);
            pre.setString(4, fullName);
            pre.setInt(5, gender);
            pre.setDate(6, new java.sql.Date(birthdate.getTime()));
            pre.setString(7, phone);
            pre.setInt(8, roleId);

            pre.setInt(9, creatorRole == 1 ? 1 : 2);

            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error inserting user: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    public Users getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return user(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkExist(String field, String value) {
        String sql = "SELECT COUNT(*) FROM Users WHERE " + field + " = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, value);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;    
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        UserDAO userD = new UserDAO();
        List<Users> users = userD.getAllUsers();
        for (Users user : users) {
            System.out.println("---------------");
            System.out.println(user.toString());
        }
    }
}

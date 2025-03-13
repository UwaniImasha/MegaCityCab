package com.megacitycab.dao;

import com.megacitycab.model.User;
import com.megacitycab.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User authenticateUser(String username, String password) {
        User user = null;

        // Database connection
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = con.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    user = new User(rs.getString("username"), rs.getString("password"));
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}

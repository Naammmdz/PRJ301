/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Naammm
 */
public class DAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO userLogin = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM tblUsers WHERE userID= ? AND password= ?";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    userLogin = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("password")
                    );
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userLogin;
    }

    public List<RoomDTO> search(String searchTerm) throws SQLException {
        List<RoomDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM tblRooms WHERE name LIKE ? AND status= ?";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + searchTerm + "%");
                ps.setString(2, "true");
                rs = ps.executeQuery();
                while (rs.next()) {
                    RoomDTO room = new RoomDTO(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("area"),
                        rs.getBoolean("status")
                    );
                    list.add(room);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean update(RoomDTO room) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String UPDATE = "UPDATE tblRooms SET name = ?, description = ?, price = ?, area = ? WHERE id = ?";
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, room.getName());
                ptm.setString(2, room.getDescription());
                ptm.setFloat(3, room.getPrice());
                ptm.setFloat(4, room.getArea());
                ptm.setString(5, room.getId());
            }
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}

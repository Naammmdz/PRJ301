/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Naammm
 */
public class UserDAO implements IDAO<UserDTO, String> {

    @Override
    public boolean create(UserDTO entity) {
        String sql = "INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) "
                + "VALUES (?, ?, ?, ?)";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getUserID());
            ps.setString(2, entity.getFullName());
            ps.setString(3, entity.getRoleID());
            ps.setString(4, entity.getPassword());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [tblUsers]";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password"));
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public UserDTO readById(String id) {
        String sql = "SELECT * FROM tblUsers WHERE userID= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password"));
                return user;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
        String sql = "UPDATE [tblUsers] SET "
                + "[fullName] = ?"
                + "[roleID] = ?"
                + "[password] = ?"
                + "WHERE [userID] = ?";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getFullName());
            ps.setString(2, entity.getRoleID());
            ps.setString(3, entity.getPassword());
            ps.setString(4, entity.getUserID());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [tblUsers] WHERE [userID] = ?";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT [userID], [fullName], [roleID], [password] FROM [tblUsers] "
                + "WHERE [userID] LIKE N'%?%' "
                + "OR [fullName] LIKE N'%?%' "
                + "OR [roleID] LIKE N'%?%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchTerm);
            ps.setString(2, searchTerm);
            ps.setString(3, searchTerm);
            ps.setString(4, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password")
                );
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}

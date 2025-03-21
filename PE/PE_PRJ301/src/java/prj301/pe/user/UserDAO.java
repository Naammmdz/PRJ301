/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301.pe.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import prj301.pe.utils.DBUtils;


/**
 *
 * @author Hoadnt
 */
public class UserDAO {
//    your code here
    public UserDTO  checkLogin(String userId, String password) 
            throws SQLException, NamingException {
        String sql = "SELECT * FROM tblUsers WHERE userID= ? AND password= ?";
       try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("password"),
                        rs.getString("roleID"),
                        rs.getBoolean("status")
                );
                return user;
            }
        } catch (ClassNotFoundException ex) {
        } catch (SQLException ex) {
        }
        return null;
    }

    public List<UserDTO> searchUser(String searchTerm) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers WHERE fullName LIKE ? AND status= '1'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO(
                    rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("password"),
                        rs.getString("roleID"),
                        rs.getBoolean("status")
                    );
                list.add(user);
                }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    
}

package pe.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.utils.DBUtils;

public class AccountDAO {

    public AccountDTO checkLogin(String id, String password) {
        String sql = "SELECT * FROM Account WHERE account= ? AND pass= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AccountDTO user = new AccountDTO(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("roleDB"),
                        rs.getString("fullName"),
                        rs.getBoolean("gender"),
                        rs.getDate("birthDay"),
                        rs.getString("phone"),
                        rs.getString("addr")
                );
                return user;
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();            
        }
        return null;
    }
    //your code here
    
    public List<AccountDTO> getAll() {
        List<AccountDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
       try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO user = new AccountDTO(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("roleDB"),
                        rs.getString("fullName"),
                        rs.getBoolean("gender"),
                        rs.getDate("birthDay"),
                        rs.getString("phone"),
                        rs.getString("addr")
                );
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace(); 
        }
        return list;
    }
    
}

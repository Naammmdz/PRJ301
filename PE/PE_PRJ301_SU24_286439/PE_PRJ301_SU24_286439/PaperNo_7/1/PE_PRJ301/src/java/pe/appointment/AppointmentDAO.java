package pe.appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.utils.DBUtils;

public class AppointmentDAO {
    //your code here
    public List<AppointmentDTO> show() {
        List<AppointmentDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Appointments";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppointmentDTO app = new AppointmentDTO(
                    rs.getInt("idApp"),
                    rs.getString("account"),
                    rs.getString("partnerPhone"),
                    rs.getString("partnerName"),
                    rs.getTimestamp("timeToMeet"),
                    rs.getString("place"),
                    rs.getFloat("expense"),
                    rs.getString("note")
                );
                list.add(app);
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }

    public boolean creat(String account, String partnerPhone, String partnerName, Timestamp timeToMeet, String place, float expense, String note) {
        String sql = "INSERT Appointments (account, partnerPhone, partnerName, timeToMeet, place, expense, note) "
                + "VALUES (?,?,?,?,?,?,?)";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, partnerPhone);
            ps.setString(3, partnerName);
            ps.setTimestamp(4, timeToMeet);
            ps.setString(5, place);
            ps.setFloat(6, expense);
            ps.setString(7, note);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

package pe.appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
}

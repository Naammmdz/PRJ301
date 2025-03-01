/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Naammm
 */
public class ProjectDAO implements IDAO<ProjectDTO, String>{

    @Override
    public boolean create(ProjectDTO entity) {
        String sql = "INSERT INTO tblStartupProjects (project_name, Description, Status, estimated_launch) "
               + "VALUES (?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setNString(1, entity.getProjectName());
            ps.setNString(2, entity.getDescription());
            ps.setString(3, entity.getStatus());
            ps.setDate(4, entity.getEstimatedLaunch());

            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<ProjectDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ProjectDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ProjectDTO entity) {
        String sql = "UPDATE tblStartupProjects " +
                 "SET project_name = ?, Description = ?, Status = ?, estimated_launch = ? " +
                 "WHERE project_id = ?";
        try (
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setNString(1, entity.getProjectName());
            ps.setNString(2, entity.getDescription());
            ps.setString(3, entity.getStatus());
            ps.setDate(4, entity.getEstimatedLaunch());
            ps.setInt(5, entity.getProjectId());

            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;    
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblStartupProjects WHERE project_id = ?";
        try (
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<ProjectDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<ProjectDTO> searchByTitle2(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ?";
        List<ProjectDTO> list = new ArrayList<ProjectDTO>();

        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+searchTerm+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ProjectDTO p = new ProjectDTO(
                        rs.getInt("project_id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getDate("estimated_launch"));               
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
}

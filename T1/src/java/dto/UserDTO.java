/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Naammm
 */
public class UserDTO {
    private String userID;
    private String fullname;
    private String roleID;
    private String password;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullname, String roleID, String password) {
        this.userID = userID;
        this.fullname = fullname;
        this.roleID = roleID;
        this.password = password;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", fullname=" + fullname + ", roleID=" + roleID + ", password=" + password + '}';
    }
    
    
}

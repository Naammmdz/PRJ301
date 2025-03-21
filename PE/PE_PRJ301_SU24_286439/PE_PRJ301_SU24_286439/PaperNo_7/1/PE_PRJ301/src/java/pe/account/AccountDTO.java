package pe.account;

import java.sql.Date;

public class AccountDTO {
    //your code here
    private String account;
    private String pass;		
    private String roleDB;
    private String fullName;					
    private boolean gender;
    private Date birthDay;
    private String phone;
    private String addr;

    public AccountDTO() {
    }

    public AccountDTO(String account, String pass, String roleDB, String fullName, boolean gender, Date birthDay, String varchar, String addr) {
        this.account = account;
        this.pass = pass;
        this.roleDB = roleDB;
        this.fullName = fullName;
        this.gender = gender;
        this.birthDay = birthDay;
        this.phone = varchar;
        this.addr = addr;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRoleDB() {
        return roleDB;
    }

    public void setRoleDB(String roleDB) {
        this.roleDB = roleDB;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
    
    
}

package com.bian.spring.entites;

public class User {
    private Integer uId;

    private String userName;

    private String pass;

    private String firstName;

    private String mail;

    private String lastName;

    private Integer privilege;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass == null ? null : pass.trim();
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName == null ? null : firstName.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }

    public Integer getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Integer privilege) {
        this.privilege = privilege;
    }

	@Override
	public String toString() {
		return "User [uId=" + uId + ", userName=" + userName + ", pass=" + pass + ", firstName=" + firstName + ", mail="
				+ mail + ", lastName=" + lastName + ", privilege=" + privilege + "]";
	}
    
    
}
package kh.finalproject.sims.admin.model.vo;

import java.util.Date;

public class AdminUserMngtVo {
	
	// USER_ID        NOT NULL  VARCHAR2(30)
	// USER_NAME	  NOT NULL  VARCHAR2(20)
	// USER_SSN		  NOT NULL  VARCHAR2(20)
	// USER_WR_DATE	  NOT NULL  DATE
	// USER_UP_DATE   NULL      DATE
	// USER_GENDER	  NOT NULL  CHAR(1)
	// USER_PHONE     NULL      VARCHAR2(30)
	// USER_EMAIL	  NULL      VARCHAR2(30)
	// USER_ADDRESS	  NULL      VARCHAR2(100)
	
	private String userId;
	private String userName;
	private String userSsn;
	private Date userWrdate;
	private Date userUpdate;
	private char gender;
	private String userPhone;
	private String email;
	private String userAddress;
	
	@Override
	public String toString() {
		return "AdminUserMngtVo [userId=" + userId + ", userName=" + userName + ", userSsn=" + userSsn + ", userWrdate="
				+ userWrdate + ", userUpdate=" + userUpdate + ", gender=" + gender + ", userPhone=" + userPhone
				+ ", email=" + email + ", userAddress=" + userAddress + "]";
	}
	
	public AdminUserMngtVo() {
		super();
	}

	
	public AdminUserMngtVo(String userId, String userName, String userSsn, Date userWrdate, Date userUpdate,
			char gender, String userPhone, String email, String userAddress) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userSsn = userSsn;
		this.userWrdate = userWrdate;
		this.userUpdate = userUpdate;
		this.gender = gender;
		this.userPhone = userPhone;
		this.email = email;
		this.userAddress = userAddress;
	}



	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}
	public Date getUserWrdate() {
		return userWrdate;
	}
	public void setUserWrdate(Date userWrdate) {
		this.userWrdate = userWrdate;
	}
	public Date getUserUpdate() {
		return userUpdate;
	}
	public void setUserUpdate(Date userUpdate) {
		this.userUpdate = userUpdate;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
	
}


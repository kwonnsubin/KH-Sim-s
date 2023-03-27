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
	private char userGender;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	
	// 조회용 변수
	private String searchUserId;	// 아이디 조회
	private String searchUserName;	// 이름 조회
	private String searchRadioVal;	// 라디오 조회
	
	@Override
	public String toString() {
		return "AdminUserMngtVo [userId=" + userId + ", userName=" + userName + ", userSsn=" + userSsn + ", userWrdate="
				+ userWrdate + ", userUpdate=" + userUpdate + ", userGender=" + userGender + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + ", searchUserId=" + searchUserId
				+ ", searchUserName=" + searchUserName + ", searchRadioVal=" + searchRadioVal + "]";
	}

	public AdminUserMngtVo() {
		super();
	}

	public AdminUserMngtVo(String userId, String userName, String userSsn, Date userWrdate, Date userUpdate,
			char userGender, String userPhone, String userEmail, String userAddress, String searchUserId,
			String searchUserName, String searchRadioVal) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userSsn = userSsn;
		this.userWrdate = userWrdate;
		this.userUpdate = userUpdate;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.searchUserId = searchUserId;
		this.searchUserName = searchUserName;
		this.searchRadioVal = searchRadioVal;
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
	public char getUserGender() {
		return userGender;
	}
	public void setUserGender(char userGender) {
		this.userGender = userGender;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getSearchUserId() {
		return searchUserId;
	}

	public void setSearchUserId(String searchUserId) {
		this.searchUserId = searchUserId;
	}

	public String getSearchUserName() {
		return searchUserName;
	}

	public void setSearchUserName(String searchUserName) {
		this.searchUserName = searchUserName;
	}

	public String getSearchRadioVal() {
		return searchRadioVal;
	}

	public void setSearchRadioVal(String searchRadioVal) {
		this.searchRadioVal = searchRadioVal;
	}
	
	
	
}


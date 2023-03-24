package kh.finalproject.sims.user.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UserMemberVo {
	
	private String userId;
	private String userName;
	private String userSsn;
	private Date userWrDate;
	private Date userUpDate;
	private String userGender;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	
	@Override
	public String toString() {
		return "UserMemberVo [userId=" + userId + ", userName=" + userName + ", userSsn=" + userSsn + ", userWrDate="
				+ userWrDate + ", userUpDate=" + userUpDate + ", userGender=" + userGender + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + "]";
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
	
	public Date getUserWrDate() {
		return userWrDate;
	}
	
	public void setUserWrDate(Date userWrDate) {
		this.userWrDate = userWrDate;
	}
	
	public Date getUserUpDate() {
		return userUpDate;
	}
	
	public void setUserUpDate(Date userUpDate) {
		this.userUpDate = userUpDate;
	}
	
	public String getUserGender() {
		return userGender;
	}
	
	public void setUserGender(String userGender) {
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

}

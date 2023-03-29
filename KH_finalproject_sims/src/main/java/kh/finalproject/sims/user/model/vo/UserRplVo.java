package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

public class UserRplVo {
	
	private int rplNo;
	private int aaNo;
	private Timestamp rplDate;
	private Timestamp rplRedate;
	private String rplContent;
	private String userId;
	private String adminId;
	
	@Override
	public String toString() {
		return "UserRplVo [rplNo=" + rplNo + ", aaNo=" + aaNo + ", rplDate=" + rplDate + ", rplRedate=" + rplRedate
				+ ", rplContent=" + rplContent + ", userId=" + userId + ", adminId=" + adminId + "]";
	}

	public UserRplVo() {
		super();
	}

	public UserRplVo(int rplNo, int aaNo, Timestamp rplDate, Timestamp rplRedate, String rplContent, String userId,
			String adminId) {
		super();
		this.rplNo = rplNo;
		this.aaNo = aaNo;
		this.rplDate = rplDate;
		this.rplRedate = rplRedate;
		this.rplContent = rplContent;
		this.userId = userId;
		this.adminId = adminId;
	}

	public int getRplNo() {
		return rplNo;
	}

	public void setRplNo(int rplNo) {
		this.rplNo = rplNo;
	}

	public int getAaNo() {
		return aaNo;
	}

	public void setAaNo(int aaNo) {
		this.aaNo = aaNo;
	}

	public Timestamp getRplDate() {
		return rplDate;
	}

	public void setRplDate(Timestamp rplDate) {
		this.rplDate = rplDate;
	}

	public Timestamp getRplRedate() {
		return rplRedate;
	}

	public void setRplRedate(Timestamp rplRedate) {
		this.rplRedate = rplRedate;
	}

	public String getRplContent() {
		return rplContent;
	}

	public void setRplContent(String rplContent) {
		this.rplContent = rplContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	

}

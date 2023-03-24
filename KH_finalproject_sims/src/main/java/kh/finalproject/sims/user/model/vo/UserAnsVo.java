package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

public class UserAnsVo {
	
	private int aaNo;
	private int aqNo;
	private String adminId;
	private String userId;
	private String aaContent;
	private Timestamp aaDate;
	private Timestamp aaRedate;
	
	@Override
	public String toString() {
		return "UserAnsVo [aaNo=" + aaNo + ", aqNo=" + aqNo + ", adminId=" + adminId + ", userId=" + userId
				+ ", aaContent=" + aaContent + ", aaDate=" + aaDate + ", aaRedate=" + aaRedate + "]";
	}

	public UserAnsVo() {
		super();
	}

	public UserAnsVo(int aaNo, int aqNo, String adminId, String userId, String aaContent, Timestamp aaDate,
			Timestamp aaRedate) {
		super();
		this.aaNo = aaNo;
		this.aqNo = aqNo;
		this.adminId = adminId;
		this.userId = userId;
		this.aaContent = aaContent;
		this.aaDate = aaDate;
		this.aaRedate = aaRedate;
	}

	public int getAaNo() {
		return aaNo;
	}

	public void setAaNo(int aaNo) {
		this.aaNo = aaNo;
	}

	public int getAqNo() {
		return aqNo;
	}

	public void setAqNo(int aqNo) {
		this.aqNo = aqNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAaContent() {
		return aaContent;
	}

	public void setAaContent(String aaContent) {
		this.aaContent = aaContent;
	}

	public Timestamp getAaDate() {
		return aaDate;
	}

	public void setAaDate(Timestamp aaDate) {
		this.aaDate = aaDate;
	}

	public Timestamp getAaRedate() {
		return aaRedate;
	}

	public void setAaRedate(Timestamp aaRedate) {
		this.aaRedate = aaRedate;
	}
	
}

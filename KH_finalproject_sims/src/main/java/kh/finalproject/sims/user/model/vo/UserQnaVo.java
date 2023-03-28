package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

public class UserQnaVo {
	
	private int aqNo;
	private String userId;
	private String aqTitle;
	private String aqContent;
	private Timestamp aqDate;
	private Timestamp aqRedate;
	private int aqViews;
	private int aqAnswers;

	@Override
	public String toString() {
		return "UserQnaVo [aqNo=" + aqNo + ", userId=" + userId + ", aqTitle=" + aqTitle + ", aqContent=" + aqContent
				+ ", aqDate=" + aqDate + ", aqRedate=" + aqRedate + ", aqViews=" + aqViews + ", aqAnswers=" + aqAnswers
				+ "]";
	}
	
	public UserQnaVo(int aqNo, String userId, String aqTitle, String aqContent, Timestamp aqDate, Timestamp aqRedate,
			int aqViews, int aqAnswers) {
		super();
		this.aqNo = aqNo;
		this.userId = userId;
		this.aqTitle = aqTitle;
		this.aqContent = aqContent;
		this.aqDate = aqDate;
		this.aqRedate = aqRedate;
		this.aqViews = aqViews;
		this.aqAnswers = aqAnswers;
	}
	
	public UserQnaVo() {
		super();
	}

	public int getAqNo() {
		return aqNo;
	}
	public void setAqNo(int aqNo) {
		this.aqNo = aqNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAqTitle() {
		return aqTitle;
	}
	public void setAqTitle(String aqTitle) {
		this.aqTitle = aqTitle;
	}
	public String getAqContent() {
		return aqContent;
	}
	public void setAqContent(String aqContent) {
		this.aqContent = aqContent;
	}
	public Timestamp getAqDate() {
		return aqDate;
	}
	public void setAqDate(Timestamp aqDate) {
		this.aqDate = aqDate;
	}
	public Timestamp getAqRedate() {
		return aqRedate;
	}
	public void setAqRedate(Timestamp aqRedate) {
		this.aqRedate = aqRedate;
	}
	public int getAqViews() {
		return aqViews;
	}
	public void setAqViews(int aqViews) {
		this.aqViews = aqViews;
	}

	public int getAqAnswers() {
		return aqAnswers;
	}

	public void setAqAnswers(int aqAnswers) {
		this.aqAnswers = aqAnswers;
	}
	
}

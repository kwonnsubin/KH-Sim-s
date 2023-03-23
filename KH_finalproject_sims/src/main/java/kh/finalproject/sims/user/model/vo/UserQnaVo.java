package kh.finalproject.sims.user.model.vo;

import java.sql.Timestamp;

public class UserQnaVo {
	
	private int aqNo;
	private String aqWriter;
	private String aqTitle;
	private String aqContent;
	private Timestamp aqDate;
	private Timestamp aqRedate;
	private int aqViews;
	
	@Override
	public String toString() {
		return "UserQnaVo [aqNo=" + aqNo + ", aqWriter=" + aqWriter + ", aqTitle=" + aqTitle + ", aqContent="
				+ aqContent + ", aqDate=" + aqDate + ", aqRedate=" + aqRedate + ", aqViews=" + aqViews + "]";
	}
	
	public UserQnaVo() {
		super();
	}

	public UserQnaVo(int aqNo, String aqWriter, String aqTitle, String aqContent, Timestamp aqDate, Timestamp aqRedate,
			int aqViews) {
		super();
		this.aqNo = aqNo;
		this.aqWriter = aqWriter;
		this.aqTitle = aqTitle;
		this.aqContent = aqContent;
		this.aqDate = aqDate;
		this.aqRedate = aqRedate;
		this.aqViews = aqViews;
	}

	public int getAqNo() {
		return aqNo;
	}
	public void setAqNo(int aqNo) {
		this.aqNo = aqNo;
	}
	public String getAqWriter() {
		return aqWriter;
	}
	public void setAqWriter(String aqWriter) {
		this.aqWriter = aqWriter;
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
	
}

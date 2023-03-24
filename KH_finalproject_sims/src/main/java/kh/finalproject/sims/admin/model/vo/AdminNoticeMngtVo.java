package kh.finalproject.sims.admin.model.vo;

import java.sql.Timestamp;

public class AdminNoticeMngtVo {
	
	
	//NTC_NO       NOT NULL    NUMBER
	//NTC_TITLE    NOT NULL    VARCHAR2(300)
	//NTC_CONTENT  NOT NULL    CLOB
	//NTC_REWRITER NULL        VARCHAR2(30)
	//NTC_DATE NOT NULL        TIMESTAMP
	//NTC_REDATE   NULL        TIMESTAMP
	//ADMIN_ID     NOT NULL    VARCHAR2(30)

	private int ntcNo;
	private String ntcTitle;
	private String ntcContent;
	private String ntcRewriter;
	private Timestamp ntcDate;
	private Timestamp ntcRedate;
	private String adminId;
	
	@Override
	public String toString() {
		return "AdminNoticeMngtVo [ntcNo=" + ntcNo + ", ntcTitle=" + ntcTitle + ", ntcContent=" + ntcContent
				+ ", ntcRewriter=" + ntcRewriter + ", ntcDate=" + ntcDate + ", ntcRedate=" + ntcRedate + ", adminId="
				+ adminId + "]";
	}
	
	
	public AdminNoticeMngtVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AdminNoticeMngtVo(int ntcNo, String ntcTitle, String ntcContent, String ntcRewriter, Timestamp ntcDate,
			Timestamp ntcRedate, String adminId) {
		super();
		this.ntcNo = ntcNo;
		this.ntcTitle = ntcTitle;
		this.ntcContent = ntcContent;
		this.ntcRewriter = ntcRewriter;
		this.ntcDate = ntcDate;
		this.ntcRedate = ntcRedate;
		this.adminId = adminId;
	}


	public int getNtcNo() {
		return ntcNo;
	}
	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}
	public String getNtcTitle() {
		return ntcTitle;
	}
	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}
	public String getNtcContent() {
		return ntcContent;
	}
	public void setNtcContent(String ntcContent) {
		this.ntcContent = ntcContent;
	}
	public String getNtcRewriter() {
		return ntcRewriter;
	}
	public void setNtcRewriter(String ntcRewriter) {
		this.ntcRewriter = ntcRewriter;
	}
	public Timestamp getNtcDate() {
		return ntcDate;
	}
	public void setNtcDate(Timestamp ntcDate) {
		this.ntcDate = ntcDate;
	}
	public Timestamp getNtcRedate() {
		return ntcRedate;
	}
	public void setNtcRedate(Timestamp ntcRedate) {
		this.ntcRedate = ntcRedate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	
	
	
}

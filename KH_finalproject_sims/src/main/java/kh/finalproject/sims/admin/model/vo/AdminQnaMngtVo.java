package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminQnaMngtVo {

	// 자주묻는질문 게시판
	private String faqNo; // 질문번호
	private String faqTitle; // 질문제목
	private String faqContent; // 질문답변내용
	private String adminId; // 관리자아이디
	private String faqRewriter; // 수정자아이디
	private Date faqDate; // 작성일
	private Date faqRedate; // 수정일
	
	// 문의 게시판 
	int aqNo; // 문의번호
	String userId; // 사용자아이디
	String aqTitle; // 문의제목
	String aqContent; // 문의내용
	Date aqDate; // 등록일
	Date aqRedate; // 수정일
	int aqViews; // 조회수
	int aqAnswers; // 답변수
	
	@Override
	public String toString() {
		return "AdminQnaMngtVo [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", adminId="
				+ adminId + ", faqRewriter=" + faqRewriter + ", faqDate=" + faqDate + ", faqRedate=" + faqRedate
				+ ", aqNo=" + aqNo + ", userId=" + userId + ", aqTitle=" + aqTitle + ", aqContent=" + aqContent
				+ ", aqDate=" + aqDate + ", aqRedate=" + aqRedate + ", aqViews=" + aqViews + ", aqAnswers=" + aqAnswers
				+ "]";
	}

	public String getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getFaqRewriter() {
		return faqRewriter;
	}

	public void setFaqRewriter(String faqRewriter) {
		this.faqRewriter = faqRewriter;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public Date getFaqRedate() {
		return faqRedate;
	}

	public void setFaqRedate(Date faqRedate) {
		this.faqRedate = faqRedate;
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

	public Date getAqDate() {
		return aqDate;
	}

	public void setAqDate(Date aqDate) {
		this.aqDate = aqDate;
	}

	public Date getAqRedate() {
		return aqRedate;
	}

	public void setAqRedate(Date aqRedate) {
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
	
	

	public AdminQnaMngtVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminQnaMngtVo(String faqNo, String faqTitle, String faqContent, String adminId, String faqRewriter,
			Date faqDate, Date faqRedate, int aqNo, String userId, String aqTitle, String aqContent, Date aqDate,
			Date aqRedate, int aqViews, int aqAnswers) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.adminId = adminId;
		this.faqRewriter = faqRewriter;
		this.faqDate = faqDate;
		this.faqRedate = faqRedate;
		this.aqNo = aqNo;
		this.userId = userId;
		this.aqTitle = aqTitle;
		this.aqContent = aqContent;
		this.aqDate = aqDate;
		this.aqRedate = aqRedate;
		this.aqViews = aqViews;
		this.aqAnswers = aqAnswers;
	}
	
	
	
	
	

	
	

	
}

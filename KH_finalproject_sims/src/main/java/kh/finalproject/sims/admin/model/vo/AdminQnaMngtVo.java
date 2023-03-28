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
	
	// 문의 답변
	int aaNo; // 답변번호
	String aaContent; // 답변내용
	Date aaDate; // 작성일
	String aaRedate; // 수정일
	
	// 문의 답변 댓글
	int rplNo; // 댓글번호
	Date rplDate; // 등록일
	Date rplRedate; // 수정일
	String rplContent; // 댓글내용
	

	public AdminQnaMngtVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminQnaMngtVo(String faqNo, String faqTitle, String faqContent, String adminId, String faqRewriter,
			Date faqDate, Date faqRedate, int aqNo, String userId, String aqTitle, String aqContent, Date aqDate,
			Date aqRedate, int aqViews, int aqAnswers, int aaNo, String aaContent, Date aaDate, String aaRedate,
			int rplNo, Date rplDate, Date rplRedate, String rplContent) {
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
		this.aaNo = aaNo;
		this.aaContent = aaContent;
		this.aaDate = aaDate;
		this.aaRedate = aaRedate;
		this.rplNo = rplNo;
		this.rplDate = rplDate;
		this.rplRedate = rplRedate;
		this.rplContent = rplContent;
	}
	
	@Override
	public String toString() {
		return "AdminQnaMngtVo [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", adminId="
				+ adminId + ", faqRewriter=" + faqRewriter + ", faqDate=" + faqDate + ", faqRedate=" + faqRedate
				+ ", aqNo=" + aqNo + ", userId=" + userId + ", aqTitle=" + aqTitle + ", aqContent=" + aqContent
				+ ", aqDate=" + aqDate + ", aqRedate=" + aqRedate + ", aqViews=" + aqViews + ", aqAnswers=" + aqAnswers
				+ ", aaNo=" + aaNo + ", aaContent=" + aaContent + ", aaDate=" + aaDate + ", aaRedate=" + aaRedate
				+ ", rplNo=" + rplNo + ", rplDate=" + rplDate + ", rplRedate=" + rplRedate + ", rplContent="
				+ rplContent + "]";
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

	public int getAaNo() {
		return aaNo;
	}

	public void setAaNo(int aaNo) {
		this.aaNo = aaNo;
	}

	public String getAaContent() {
		return aaContent;
	}

	public void setAaContent(String aaContent) {
		this.aaContent = aaContent;
	}

	public Date getAaDate() {
		return aaDate;
	}

	public void setAaDate(Date aaDate) {
		this.aaDate = aaDate;
	}

	public String getAaRedate() {
		return aaRedate;
	}

	public void setAaRedate(String aaRedate) {
		this.aaRedate = aaRedate;
	}

	public int getRplNo() {
		return rplNo;
	}

	public void setRplNo(int rplNo) {
		this.rplNo = rplNo;
	}

	public Date getRplDate() {
		return rplDate;
	}

	public void setRplDate(Date rplDate) {
		this.rplDate = rplDate;
	}

	public Date getRplRedate() {
		return rplRedate;
	}

	public void setRplRedate(Date rplRedate) {
		this.rplRedate = rplRedate;
	}

	public String getRplContent() {
		return rplContent;
	}

	public void setRplContent(String rplContent) {
		this.rplContent = rplContent;
	}

		
}

package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class AdminQnaMngtVo {


	// 문의 게시판 
	private int aqNo; // 문의번호
	private String userId; // 사용자아이디
	private String aqTitle; // 문의제목
	private String aqContent; // 문의내용
	private Date aqDate; // 등록일
	private Date aqRedate; // 수정일
	private int aqViews; // 조회수
	private int aqAnswers; // 답변수
	private List<AdminQnaAnsVo> ansList; // 여러 댓글이 들어간다.

	
	
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
	public List<AdminQnaAnsVo> getAnsList() {
		return ansList;
	}
	public void setAnsList(List<AdminQnaAnsVo> ansList) {
		this.ansList = ansList;
	}
	
	
		
}

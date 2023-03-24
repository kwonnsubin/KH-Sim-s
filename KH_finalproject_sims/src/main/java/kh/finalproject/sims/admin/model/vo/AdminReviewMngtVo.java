package kh.finalproject.sims.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminReviewMngtVo {
//	REVIEW_NO     NOT NULL NUMBER    
//	USER_ID                VARCHAR2(30) 
//	BIZ_ID                 VARCHAR2(30) 
//	REPORT_DATE            DATE         
//	REPORT_STATUS          NUMBER 
	
	private int reviewNo; // 리뷰번호
	private String userId; // 사용자아이디
	private String bizId; // 통신사아이디
	private Date reportDate; // 신고일자
	private String reportStatus; // 신고처리상태
	private String reviewContent; // 리뷰내용
	private String reportReason; // 신고사유
	
	@Override
	public String toString() {
		return "AdminReviewMngtVo [reviewNo=" + reviewNo + ", userId=" + userId + ", bizId=" + bizId + ", reportDate="
				+ reportDate + ", reportStatus=" + reportStatus + ", reviewContent=" + reviewContent + ", reportReason="
				+ reportReason + "]";
	}

	
	
	public AdminReviewMngtVo() {
		super();
		// TODO Auto-generated constructor stub
	}



	public AdminReviewMngtVo(int reviewNo, String userId, String bizId, Date reportDate, String reportStatus,
			String reviewContent, String reportReason) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.bizId = bizId;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reviewContent = reviewContent;
		this.reportReason = reportReason;
	}



	public int getReviewNo() {
		return reviewNo;
	}



	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getBizId() {
		return bizId;
	}



	public void setBizId(String bizId) {
		this.bizId = bizId;
	}



	public Date getReportDate() {
		return reportDate;
	}



	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}



	public String getReportStatus() {
		return reportStatus;
	}



	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}



	public String getReviewContent() {
		return reviewContent;
	}



	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}



	public String getReportReason() {
		return reportReason;
	}



	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	
}

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
	private int reportStatus; // 신고처리상태
	private String reviewContent; // 리뷰내용
	
	@Override
	public String toString() {
		return "AdminReviewMngtVo [reviewNo=" + reviewNo + ", userId=" + userId + ", bizId=" + bizId + ", reportDate="
				+ reportDate + ", reportStatus=" + reportStatus + ", reviewContent=" + reviewContent + "]";
	}
	

	public AdminReviewMngtVo() {
		super();
	}



	public AdminReviewMngtVo(int reviewNo, String userId, String bizId, Date reportDate, int reportStatus,
			String reviewContent) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.bizId = bizId;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reviewContent = reviewContent;
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


	public int getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
}

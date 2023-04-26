package kh.finalproject.sims.biz.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BizReviewMngtVo {
//	desc biz_review
	
//	REVIEW_NO      NOT NULL NUMBER         
//	REVIEW_CONTENT NOT NULL VARCHAR2(4000) 
//	REVIEW_DATE    NOT NULL TIMESTAMP(6)   
//	REVIEW_REDATE           TIMESTAMP(6)   
//	REVIEW_STAR    NOT NULL NUMBER         
//	USER_ID        NOT NULL VARCHAR2(30)   
//	BIZ_ID         NOT NULL VARCHAR2(30)   
//	REVIEW_HIDDEN           NUMBER  
	
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private Date reviewRedate;
	private int reviewStar;
	private String userId;
	private String bizId;
	private int reviewHidden;
	
	private int rn;
	private int listCnt;
	
	// 사용자 리뷰 리스트
	private String bizName;
	
//	------------- -------- ------------ 
//  desc review_report
	
//	REVIEW_NO     NOT NULL NUMBER       
//	REPORT_DATE            DATE         
//	REPORT_STATUS          NUMBER       
//	REPORT_REASON NOT NULL VARCHAR2(50) 
	
	private Date reportDate;
	private Integer reportStatus;
	private String reportReason;
}

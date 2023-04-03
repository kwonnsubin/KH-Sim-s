package kh.finalproject.sims.admin.model.vo;

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
public class AdminReviewMngtVo {
//	REVIEW_NO     NOT NULL NUMBER    
//	USER_ID                VARCHAR2(30) 
//	BIZ_ID                 VARCHAR2(30) 
//	REPORT_DATE            DATE         
//	REPORT_STATUS          NUMBER 
	
//	  REVIEW_NO
//	  , REVIEW_CONTENT
//	  , REVIEW_DATE
//	  , REVIEW_STAR
//	  , USER_ID
//	  , BIZ_ID
//	  , REVIEW_HIDDEN
	
	private int reviewNo; // 리뷰번호
	private String userId; // 사용자아이디
	private String bizId; // 통신사아이디
	private Date reportDate; // 신고일자
	private String reportStatus; // 신고처리상태
	private String reviewContent; // 리뷰내용
	private String reportReason; // 신고사유
	private int reviewHidden; // 숨김처리
	private Date reviewDate; // 리뷰등록일
	private int reviewStar; // 별점
	
	// 조회용 변수
	private String searchOption;	// 조회 조건 
	private String searchBox;		// 조회 문구
	
}

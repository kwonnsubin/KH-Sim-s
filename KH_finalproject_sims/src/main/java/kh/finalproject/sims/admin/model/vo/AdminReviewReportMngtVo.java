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
public class AdminReviewReportMngtVo {
	
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
	private int n; // rowNumber
}

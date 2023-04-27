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
public class BizMyPageVo {
	int todayReviewCnt;
	int totalReviewCnt;
	int todayApplyCnt;
	int totalApplyCnt;
	int totalPlanCnt;
	
	String originalFilename;
	String logoRenameFilename;
	
	int rn;
	String reviewContent;
	int reviewStar;
	String userId;
	Date reviewDate;
}

package kh.finalproject.sims.admin.model.vo;

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
public class AdminStatisticsVo {
	private int planNo;
	private String planName;
	private String bizName; 
	private int cnt; 
	
	// 연령대별 가장 인기있는 요금제
	private String ageGroup;
	//private String bizName;
	//private String planName;
	//private int cnt;
	int rn;
	
	// 별점순 통신사 랭킹
	double bizReviewStar;
	
	// 월별 가입자 수
	String orderMonth;
	
	// 일별 총 가입자 수
	String userWrDate;
	
	// 일별 성별 가입자 수
	int maleCnt;
	int femaleCnt;
	
	// 성별 가입자 수 비율
	int totalCnt;
	double maleRatio;
	double femaleRatio;
	
	// 연령대 가입자 수 비율
	int ageGroupCnt;
	double ageGroupRatio;
	
}

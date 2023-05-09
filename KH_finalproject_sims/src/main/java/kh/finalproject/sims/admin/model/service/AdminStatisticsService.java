package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

public interface AdminStatisticsService {
	
	// 요금제 랭킹 - 가입자 많은 순
	public List<AdminStatisticsVo> selectOrderByRegistration() throws Exception;
	
	// 연령대별 가장 인기있는 요금제
	public  List<AdminStatisticsVo> selectAgeGroupPlans() throws Exception;
	
	// 별점순 통신사
	public List<AdminStatisticsVo> selectStarRating() throws Exception;
	
	// 월별 가입자 수
	public List<AdminStatisticsVo> selectMonthlyPlanOrderCount() throws Exception;
	
	// 연령대별 총 가입자 수
	public List<AdminStatisticsVo> selectAgeGroupPlanOrderCount() throws Exception;
	
	// 일별 총 가입자 수 변화
	public List<AdminStatisticsVo> selectDailyTotalUserWriteCount() throws Exception;
	
	// 일별 성별 가입자 수 변화
	public List<AdminStatisticsVo> selectDailyGenderUserWriteCount() throws Exception;
	
	// 성별 가입자 수 비율
	public AdminStatisticsVo selectGenderRatioByTotalUserRatio() throws Exception;
	
	// 연령대 가입자 수 비율
	public List<AdminStatisticsVo> selectAgeGroupByTotalUserRatio() throws Exception;
}

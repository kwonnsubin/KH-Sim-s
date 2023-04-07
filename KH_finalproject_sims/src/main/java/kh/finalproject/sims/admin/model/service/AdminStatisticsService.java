package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

public interface AdminStatisticsService {
	
	// 요금제 랭킹 - 가입자 많은 순
	public List<AdminStatisticsVo> selectOrderByRegistration();
	
	// 연령대별 가장 인기있는 요금제
	public  List<AdminStatisticsVo> selectAgeGroupPlans();
	
	// 별점순 통신사
	public List<AdminStatisticsVo> selectStarRating();
	
	// 월별 가입자 수
	public List<AdminStatisticsVo> selectMonthlyPlanOrderCount();
}

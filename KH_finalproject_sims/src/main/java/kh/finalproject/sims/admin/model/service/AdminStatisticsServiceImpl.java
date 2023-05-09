package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminStatisticsDao;
import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

@Service 
public class AdminStatisticsServiceImpl implements AdminStatisticsService {
	@Autowired
	AdminStatisticsDao dao;
	
	// 요금제 랭킹 - 가입자 많은 순
	@Override
	public List<AdminStatisticsVo> selectOrderByRegistration()throws Exception {
		return dao.selectOrderByRegistration();
	}

	
	// 연령대별 가장 인기있는 요금제
	@Override
	public List<AdminStatisticsVo> selectAgeGroupPlans()throws Exception {
		return dao.selectAgeGroupPlans();
	}


	// 별점순 통신사
	@Override
	public List<AdminStatisticsVo> selectStarRating()throws Exception {
		return dao.selectStarRating();
	}

	// 월별 가입자 수
	@Override
	public List<AdminStatisticsVo> selectMonthlyPlanOrderCount()throws Exception {
		return dao.selectMonthlyPlanOrderCount();
	}

	// 연령대별 총 가입자 수
	@Override
	public List<AdminStatisticsVo> selectAgeGroupPlanOrderCount()throws Exception {
		return dao.selectAgeGroupPlanOrderCount();
	}

	// 일별 가입자 수 변화
	@Override
	public List<AdminStatisticsVo> selectDailyTotalUserWriteCount()throws Exception {
		return dao.selectDailyUserWriteCount();
	}

	// 일별 성별 가입자 수 변화
	@Override
	public List<AdminStatisticsVo> selectDailyGenderUserWriteCount()throws Exception {
		return dao.selectDailyGenderUserWriteCount();
	}

	// 성별 가입자 수 비율
	@Override
	public AdminStatisticsVo selectGenderRatioByTotalUserRatio()throws Exception {
		return dao.selectGenderRatioByTotalUserRatio();
	}

	// 연령대 가입자 수 비율
	@Override
	public List<AdminStatisticsVo> selectAgeGroupByTotalUserRatio()throws Exception {
		return dao.selectAgeGroupByTotalUserRatio();
	}
	
	

}

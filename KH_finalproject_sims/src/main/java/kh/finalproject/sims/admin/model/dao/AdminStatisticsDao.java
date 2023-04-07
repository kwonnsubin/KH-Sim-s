package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

@Repository
public class AdminStatisticsDao {
	@Autowired
	SqlSession sqlSession;
	
	// 요금제 랭킹 - 가입자 많은 순
	public List<AdminStatisticsVo> selectOrderByRegistration() {
		return sqlSession.selectList("admin.selectOrderByRegistration");
	}
	
	// 연령대별 가장 인기있는 요금제
	public  List<AdminStatisticsVo> selectAgeGroupPlans() {
		return sqlSession.selectList("admin.selectAgeGroupPlans");
	}
	
	// 별점순 통신사
	public List<AdminStatisticsVo> selectStarRating() {
		return sqlSession.selectList("admin.selectStarRating");
	}
	
	// 월별 총 가입자 수
	public List<AdminStatisticsVo> selectMonthlyPlanOrderCount() {
		return sqlSession.selectList("admin.selectMonthlyPlanOrderCount");
	}
	
	// 연령대별 총 가입자 수
	public List<AdminStatisticsVo> selectAgeGroupPlanOrderCount() {
		return sqlSession.selectList("admin.selectAgeGroupPlanOrderCount");
	}
	
	// 일별 가입자 수 변화
	public List<AdminStatisticsVo> selectDailyUserWriteCount() {
		return sqlSession.selectList("admin.selectDailyUserWriteCount");
	}
}

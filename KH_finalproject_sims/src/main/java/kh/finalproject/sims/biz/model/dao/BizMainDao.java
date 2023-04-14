package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMainVo;

@Repository
public class BizMainDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizChartVo> selectJoinPlanByDate(String bizid){
		return sqlSession.selectList("bizChart.selectJoinPlanByDate", bizid);
	}
	
	public List<BizMainVo> selectTotalApplyByPlan(String bizid){
		return sqlSession.selectList("bizChart.selectTotalApplyByPlan", bizid);
	}
	
	public List<BizMainVo> selectTopPlanAgeRatio(String bizid){
		return sqlSession.selectList("bizChart.selectTopPlanAgeRatio", bizid);
	}
	
	public List<BizMainVo> selectTopPlanGenderRatio(String bizid){
		return sqlSession.selectList("bizChart.selectTopPlanGenderRatio", bizid);
	}
	
	public List<BizMainVo> selectBizAgeRatio(String bizid){
		return sqlSession.selectList("bizChart.selectBizAgeRatio", bizid);
	}
	
	public List<BizMainVo> selectBizGenderRatio(String bizid){
		return sqlSession.selectList("bizChart.selectBizGenderRatio", bizid);
	}
	
	public String selectTopPlanName(String bizid) {
		return sqlSession.selectOne("bizChart.selectTopPlanName",bizid);
	}
	
}

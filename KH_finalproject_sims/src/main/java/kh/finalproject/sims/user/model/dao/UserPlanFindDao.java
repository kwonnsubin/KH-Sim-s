package kh.finalproject.sims.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Repository
public class UserPlanFindDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PlanVo> selectPlanList(String searchText) {
		return sqlSession.selectList("plan.selectPlanList", searchText);
	}

	public int cntPlanList(String searchText) {
		return sqlSession.selectOne("plan.cntPlanList", searchText);
	}
	
	public List<PlanVo> selectPlanList(Map searchMap) {
		return sqlSession.selectList("plan.selectSearchPlanList", searchMap);
	}
	
	public int cntPlanList(Map searchMap) {
		return sqlSession.selectOne("plan.cntSearchPlanList", searchMap);
	}

	public List<BizInfoMngtVo> selectBizNameList() {
		return sqlSession.selectList("plan.bizNameList");
	}

	public List<CustomQueVo> selectCustonQueList(String userId) {
		return sqlSession.selectList("plan.customQueList", userId);
	}

	// 매퍼 추가 해야함
	public int insertQueVal(Map<String, Object> val) {
		return sqlSession.insert("plan.insertQueVal", val);
	}
	
}

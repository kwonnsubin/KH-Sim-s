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
	
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap) {
		return sqlSession.selectList("plan.selectPlanList", searchMap);
	}

	public int cntPlanList(Map<String, Object> searchMap) {
		return sqlSession.selectOne("plan.cntPlanList", searchMap);
	}
	
	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap) {
		return sqlSession.selectList("plan.selectPlanFilterList", searchMap);
	}
	
	public int cntPlanFilterList(Map<String, Object> searchMap) {
		return sqlSession.selectOne("plan.cntSearchPlanFilterList", searchMap);
	}

	public List<BizInfoMngtVo> selectBizNameList() {
		return sqlSession.selectList("plan.bizNameList");
	}

	public CustomQueVo  selectCustomQueList(String userId) {
		return sqlSession.selectOne("plan.customQue", userId);
	}

	public int insertQueVal(Map<String, Object> val) {
		return sqlSession.update("plan.insertQueVal", val);
	}

	public int selectUser(String userId) {
		return sqlSession.selectOne("plan.selectUser", userId);
	}

	public void insertUser(String userId) {
		sqlSession.insert("plan.insertUser", userId);
	}

	public List<PlanVo> selectViewRankList() {
		return sqlSession.selectList("plan.selectViewRankList");
	}

	public List<PlanVo> selectLikeRankList() {
		return sqlSession.selectList("plan.selectLikeRankList");
	}

	public List<PlanVo> selectOrderRankList() {
		return sqlSession.selectList("plan.selectOrderRankList");
	}

	public List<PlanVo> selectBizPlanList(String bizId) {
		return sqlSession.selectList("plan.selectBizPlanList", bizId);
	}
	
}

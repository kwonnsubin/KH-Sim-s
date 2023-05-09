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
	
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("plan.selectPlanList", searchMap);
	}

	public int cntPlanList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectOne("plan.cntPlanList", searchMap);
	}
	
	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("plan.selectPlanFilterList", searchMap);
	}
	
	public int cntPlanFilterList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectOne("plan.cntPlanFilterList", searchMap);
	}

	public List<String> selectBizNameList() throws Exception {
		return sqlSession.selectList("plan.bizNameList");
	}

	public CustomQueVo  selectCustomQueList(String userId) throws Exception {
		return sqlSession.selectOne("plan.customQue", userId);
	}

	public int insertQueVal(Map<String, Object> val) throws Exception {
		return sqlSession.update("plan.insertQueVal", val);
	}

	public int selectUser(String userId) throws Exception {
		return sqlSession.selectOne("plan.selectUser", userId);
	}

	public void insertUser(String userId) throws Exception {
		sqlSession.insert("plan.insertUser", userId);
	}

	public List<PlanVo> selectViewRankList() throws Exception {
		return sqlSession.selectList("plan.selectViewRankList");
	}

	public List<PlanVo> selectLikeRankList() throws Exception {
		return sqlSession.selectList("plan.selectLikeRankList");
	}

	public List<PlanVo> selectOrderRankList() throws Exception {
		return sqlSession.selectList("plan.selectOrderRankList");
	}

	public List<PlanVo> selectBizPlanList(String bizId) throws Exception {
		return sqlSession.selectList("plan.selectBizPlanList", bizId);
	}

	public List<BizInfoMngtVo> selectBizIdList() throws Exception {
		return sqlSession.selectList("plan.selectBizIdList");
	}
	
}

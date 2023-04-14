package kh.finalproject.sims.biz.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;

@Repository
public class BizApplyMngtDao {
	@Autowired
	private SqlSession sqlSession;
	
	public BizApplyVo selectApplyDetailUser(int orderNo) {
		return sqlSession.selectOne("apply.selectApplyDetailUser",orderNo);
	}
	
	public BizApplyVo selectApplyDetailPlan(int orderNo) {
		return sqlSession.selectOne("apply.selectApplyDetailPlan",orderNo);
	}

	public int updateApproveStatus(Map<String, Object> map) {
		return sqlSession.update("apply.updateApproveStatus", map);
	}

	public int updateHoldStatus(Map<String, Object> map) {
		return sqlSession.update("apply.updateHoldStatus",map);
	}

	public List<BizApplyVo> selectBizPlanApplyList(String bizid) {
		return sqlSession.selectList("apply.selectBizPlanApplyList", bizid);
	}

	public int getApplyListCnt(String bizid) {
		return sqlSession.selectOne("apply.getApplyListCnt", bizid);
	}

	public List<BizApplyVo> selectPage(Map<String, Object> map) {
		return sqlSession.selectList("apply.selectPage", map);
	}

	public int getSearchApplyListCount(Map<String, String> mapCnt) {
		return sqlSession.selectOne("apply.getSearchApplyListCount",mapCnt);
	}

	public List<BizApplyVo> searchApplyList(Map<String, Object> map) {
		return sqlSession.selectList("apply.searchApplyList", map);
	}

	//분류에 따른 리스트
	public int getDevisionApplyListCount(Map<String, Object> mapCnt) {
		return sqlSession.selectOne("apply.getDevisionApplyListCount", mapCnt);
	}

	public List<BizApplyVo> getDevisionPage(Map<String, Object> map) {
		return sqlSession.selectList("apply.getDevisionPage", map);
	}
}

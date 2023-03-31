package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Repository
public class BizPlanMngtDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizPlanMngtVo> selectBizPlanList(String bizid){
		return sqlSession.selectList("bizPlan.selectPlanList", bizid);
	}

	public BizPlanMngtVo selectBizPlanDetail(int planNo) {
		return sqlSession.selectOne("bizPlan.selectBizPlanDetail", planNo);
	}

	public int registerBizPlan(BizPlanMngtVo vo) {
		return sqlSession.insert("bizPlan.registerBizPlan",vo);
	}

	public BizPlanMngtVo findByBizName(String bizid) {
		return sqlSession.selectOne("bizPlan.findByBizName", bizid);
	}

	public int getPlanListCnt(String bizid) {
		return sqlSession.selectOne("bizPlan.getPlanListCount", bizid);
	}
	
	
	
}

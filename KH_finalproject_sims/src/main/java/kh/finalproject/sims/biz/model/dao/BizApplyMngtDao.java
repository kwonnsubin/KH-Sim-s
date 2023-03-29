package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;

@Repository
public class BizApplyMngtDao {
	@Autowired
	private SqlSession sqlSession;
	
	public BizApplyVo selectApplyDetailUser() {
		return sqlSession.selectOne("apply.selectApplyDetailUser");
	}
	
	public BizApplyVo selectApplyDetailPlan() {
		return sqlSession.selectOne("apply.selectApplyDetailPlan");
	}


	public int updateApproveStatus( ) {
		return sqlSession.update("apply.updateApproveStatus");
	}

	public int updateHoldStatus() {
		return sqlSession.update("apply.updateHoldStatus");
	}

	public List<BizApplyVo> selectBizPlanApplyList(String bizid) {
		return sqlSession.selectList("apply.selectBizPlanApplyList", bizid);
	}
}

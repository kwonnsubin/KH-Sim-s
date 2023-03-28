package kh.finalproject.sims.biz.model.dao;

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


	public int updateApproveStatus(BizApplyVo vo) {
		return sqlSession.update("apply.updateApproveStatus", vo);
	}
}

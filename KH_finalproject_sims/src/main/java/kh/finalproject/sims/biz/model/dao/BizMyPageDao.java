package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizMyPageVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Repository
public class BizMyPageDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int getTodayReviewCnt(String bizid) throws Exception {
		return sqlSession.selectOne("mypage.getTodayReviewCnt", bizid);
	}

	public int getTotalReviewCnt(String bizid) throws Exception {
		return sqlSession.selectOne("mypage.getTotalReviewCnt", bizid);
	}
	
	public int getTodayApplyCnt(String bizid) throws Exception {
		return sqlSession.selectOne("mypage.getTodayApplyCnt", bizid);
	}
	
	public int getTotalApplyCnt(String bizid) throws Exception {
		return sqlSession.selectOne("mypage.getTotalApplyCnt", bizid);
	}
	
	public int getTotalPlanCnt(String bizid)throws Exception {
		return sqlSession.selectOne("mypage.getTotalPlanCnt", bizid);
	}
	
	public BizMyPageVo getLogo(String bizid) throws Exception{
		return sqlSession.selectOne("mypage.getLogo",bizid);
	}
	
	public List<BizMyPageVo> getRecentReview(String bizid)throws Exception{
		return sqlSession.selectList("mypage.getRecentReview", bizid);
	}
	
	public List<BizPlanMngtVo> getTopFivePlanInfo(String bizid) throws Exception{
		return sqlSession.selectList("mypage.getTopFivePlanInfo", bizid);
	}
}

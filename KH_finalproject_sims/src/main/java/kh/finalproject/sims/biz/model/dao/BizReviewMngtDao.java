package kh.finalproject.sims.biz.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;

@Repository
public class BizReviewMngtDao {
	@Autowired
	private SqlSession sqlSession;

	public int getReviewListCount(String bizid) throws Exception {
		return sqlSession.selectOne("bizReview.getReviewListCount", bizid);
	}
	
	public List<BizReviewMngtVo> selectPage(Map<String, Object>map) throws Exception{
		return sqlSession.selectList("bizReview.selectPage", map);
	}

	public int reportReview(BizReviewMngtVo vo)throws Exception {
		return sqlSession.insert("bizReview.reportReview", vo);
	}

	public int cancleReport(int reviewNo) throws Exception{
		return sqlSession.delete("bizReview.cancleReport",reviewNo );
	}
	
	public BizReviewMngtVo selectReviewDetail(int reviewNo) throws Exception{
		return sqlSession.selectOne("bizReview.selectReviewDetail", reviewNo);
	}

	public List<BizReviewMngtVo> selectBizReviewList(String bizId) throws Exception{
		return sqlSession.selectList("bizReview.selectBizReviewList", bizId);
	}

	
	//신고처리상태 분류에 따른 조회
	public int selectByReportStatusCnt(Map<String, Object> map)throws Exception {
		return sqlSession.selectOne("selectByReportStatusCnt", map);
	}

	public List<BizReviewMngtVo> selectByReportStatus(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("selectByReportStatus", map);
	}


}

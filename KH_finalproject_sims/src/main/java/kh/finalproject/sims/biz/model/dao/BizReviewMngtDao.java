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

	public int getReviewListCount(String bizid) {
		return sqlSession.selectOne("bizReview.getReviewListCount", bizid);
	}
	
	public List<BizReviewMngtVo> selectPage(Map<String, Object>map){
		return sqlSession.selectList("bizReview.selectPage", map);
	}

	public int reportReview(BizReviewMngtVo vo) {
		return sqlSession.insert("bizReview.reportReview", vo);
	}

	public int cancleReport(int reviewNo) {
		return sqlSession.delete("bizReview.cancleReport",reviewNo );
	}
	
	public BizReviewMngtVo selectReviewDetail(int reviewNo) {
		return sqlSession.selectOne("bizReview.selectReviewDetail", reviewNo);
	}
	
}

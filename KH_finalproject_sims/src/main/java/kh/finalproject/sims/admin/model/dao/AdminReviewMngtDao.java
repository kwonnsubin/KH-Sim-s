package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Repository
public class AdminReviewMngtDao {
	@Autowired
	SqlSession sqlSession;
	
	// 신고리뷰리스트
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return sqlSession.selectList("admin.selectReviewReportList");
	}
	
	// 신고리뷰상세
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo) {
		return sqlSession.selectOne("admin.selectReviewReportDetail", reviewNo);
	}
	
	// 신고 리뷰 처리(반려/삭제)
	public int updateReviewReportStatus(AdminReviewMngtVo vo) {
		return sqlSession.update("admin.updateReviewReportStatus", vo);
	}
	
	// 신고리뷰숨김
	public int updateReviewHidden(AdminReviewMngtVo vo) {
		return sqlSession.update("admin.updateReviewHidden", vo);
	}
	
	// 리뷰목록
	public List<AdminReviewMngtVo> selectReviewList() {
		return sqlSession.selectList("admin.selectReviewList");
	}
	
	// 리뷰검색
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) {
		return sqlSession.selectList("admin.selectSearchReviewList", vo);
	}
	
	// 리뷰삭제
	public int deleteReview(int reviewNo) {
		return sqlSession.delete("admin.deleteReview", reviewNo);
	}
	
	// 리뷰상세내용
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) {
		return sqlSession.selectOne("admin.selectReviewDetail", reviewNo);
	}
	
}

package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewReportMngtVo;

@Repository
// 신고리뷰
public class AdminReviewReportMngtDao {
	@Autowired
	SqlSession sqlSession;
	
	// 리스트
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return sqlSession.selectList("admin.selectReviewReportList");
	}
	
	// 검색
	public List<AdminReviewMngtVo> selectSearchReviewReportList(AdminReviewMngtVo vo) {
		return sqlSession.selectList("admin.selectSearchReviewReportList", vo);
	}
	
	// 상세
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo) {
		return sqlSession.selectOne("admin.selectReviewReportDetail", reviewNo);
	}
	
	// 처리(반려/삭제)
	public int updateReviewReportStatus(AdminReviewMngtVo vo) {
		return sqlSession.update("admin.updateReviewReportStatus", vo);
	}
	
	// 숨김
	public int updateReviewHidden(AdminReviewMngtVo vo) {
		return sqlSession.update("admin.updateReviewHidden", vo);
	}
	
	// 페이징 search
	public List<AdminReviewReportMngtVo> searchReviewReportPageList(Map<String, Object> map) {
		return sqlSession.selectList("admin.searchReviewReportPageList", map); // 한 페이지의 글 목록
	}
	
	// 글목록 총 갯수 search
	public int getSearchReviewReportListCnt() {
		return sqlSession.selectOne("admin.getSearchReviewReportPageCnt");
	}
}

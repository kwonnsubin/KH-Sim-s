package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Repository
// 리뷰
public class AdminReviewMngtDao {
	@Autowired
	SqlSession sqlSession;
	
	// 목록
	public List<AdminReviewMngtVo> selectReviewList() {
		return sqlSession.selectList("admin.selectReviewList");
	}
	
	// 검색
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) {
		return sqlSession.selectList("admin.selectSearchReviewList", vo);
	}
	
	// 삭제
	public int deleteReview(int reviewNo) {
		return sqlSession.delete("admin.deleteReview", reviewNo);
	}
	
	// 상세내용
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) {
		return sqlSession.selectOne("admin.selectReviewDetail", reviewNo);
	}	
	
	// 페이징 search
	public List<AdminReviewMngtVo> searchReviewPageList(Map<String, Object> map) {
		return sqlSession.selectList("admin.searchReviewPageList", map); // 한 페이지의 글 목록
	}
	
	// 글목록 총 갯수 search
	public int getSearchReviewListCnt() {
		return sqlSession.selectOne("admin.getSearchReviewPageCnt");
	}
	
}

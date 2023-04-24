package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

// 리뷰
public interface AdminReviewMngtService {
	
	// 목록
	public List<AdminReviewMngtVo> selectReviewList();
	
	// 검색
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo);
	
	// 삭제
	public int deleteReview(int reviewNo);
	
	// 상세내용
	public AdminReviewMngtVo selectReviewDetail(int reviewNo);
	
	// search
	public Search getPage(int pNum, int cnt, String keyword, String searchType);
	
}

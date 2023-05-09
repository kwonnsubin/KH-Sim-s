package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

// 리뷰
public interface AdminReviewMngtService {
	
	// 목록
	public List<AdminReviewMngtVo> selectReviewList() throws Exception;
	
	// 검색
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) throws Exception;
	
	// 삭제
	public int deleteReview(int reviewNo) throws Exception;
	
	// 상세내용
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) throws Exception;
	
	// search
	public Search getPage(int pNum, int cnt, String keyword, String searchType) throws Exception;
	
}

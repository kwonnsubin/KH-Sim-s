package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

public interface AdminReviewMngtService {
	
	// 신고리뷰목록
	public List<AdminReviewMngtVo> selectReviewReportList();
	
	// 신고리뷰 검색
	public List<AdminReviewMngtVo> selectSearchReviewReportList(AdminReviewMngtVo vo);
	
	// 신고리뷰상세
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo);
	
	// 신고 리뷰 처리(반려/삭제)
	public int updateReviewReportStatus(AdminReviewMngtVo vo);
	
	// 리뷰목록
	public List<AdminReviewMngtVo> selectReviewList();
	
	// 리뷰검색
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo);
	
	// 리뷰삭제
	public int deleteReview(int reviewNo);
	
	// 리뷰상세내용
	public AdminReviewMngtVo selectReviewDetail(int reviewNo);
	
}

package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Service
public class AdminReviewMngtServiceImpl implements AdminReviewMngtService{
	@Autowired
	AdminReviewMngtDao dao;
	
	// 신고리뷰목록
	@Override
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return dao.selectReviewReportList();
	}

	// 신고리뷰상세
	@Override
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo) {
		return dao.selectReviewReportDetail(reviewNo);
	}

	// 신고 리뷰 처리(반려/삭제)
	@Override
	public int updateReviewReportStatus(AdminReviewMngtVo vo) {
		
		// 신고리뷰숨김
		dao.updateReviewHidden(vo);
		
		return dao.updateReviewReportStatus(vo);
	}
	
	// 리뷰목록
	@Override
	public List<AdminReviewMngtVo> selectReviewList() {
		return dao.selectReviewList();
	}
	
	// 리뷰검색
	@Override
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) {
		return dao.selectSearchReviewList(vo);
	}
	
	// 리뷰삭제
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
	// 리뷰상세내용
	@Override
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) {
		return dao.selectReviewDetail(reviewNo);
	}



}

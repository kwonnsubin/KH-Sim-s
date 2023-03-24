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

}

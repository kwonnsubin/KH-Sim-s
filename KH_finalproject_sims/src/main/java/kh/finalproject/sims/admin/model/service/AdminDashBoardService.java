package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

public interface AdminDashBoardService{

	// 리뷰 리스트
	public List<AdminReviewMngtVo> selectDashboardBizReview();
}

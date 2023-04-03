package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

public interface AdminDashBoardService{

	// 리뷰 리스트
	public List<AdminReviewMngtVo> selectDashboardBizReview();
	
	// 질문/답변 리스트
	public List<AdminQnaMngtVo> selectDashBoardQna();
	
	// 신고 리스트
	public List<AdminReviewMngtVo> selectDashBoardReviewReport();
	
	// 가입자 수
	public int selectDashBoardPlanOrderCount();
	
	// 통신사 신청 수
	public int selectDashBoardBizWriteCount();
	
	// 통신사 총 등록 수
	public int selectDashBoardBizTotalCount();
}

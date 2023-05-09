package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminDashBoardVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

public interface AdminDashBoardService{

	// 리뷰 리스트
	public List<AdminReviewMngtVo> selectDashboardBizReview() throws Exception;
	
	// 질문/답변 리스트
	public List<AdminQnaMngtVo> selectDashBoardQna() throws Exception;
	
	// 신고 리스트
	public List<AdminReviewMngtVo> selectDashBoardReviewReport() throws Exception;
	
	// 가입자 수
	public int selectDashBoardPlanOrderCount() throws Exception;
	
	// 통신사 신청 수
	public int selectDashBoardBizWriteCount() throws Exception;
	
	// 통신사 총 등록 수
	public int selectDashBoardBizTotalCount() throws Exception;
	
	// 요금제별 가입신청 수
	public List<AdminDashBoardVo> selectDashBoardPlanOrderChart() throws Exception;
	
	// 일별 총 가입자 수 변화
	public List<AdminDashBoardVo> selectDashBoardDailyTotalUserWriteCount() throws Exception;
}

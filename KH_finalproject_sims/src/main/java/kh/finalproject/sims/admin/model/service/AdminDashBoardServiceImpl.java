package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminDashBoardDao;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@Service
public class AdminDashBoardServiceImpl implements AdminDashBoardService {
	@Autowired
	AdminDashBoardDao dao;
	
	// 리뷰 리스트
	@Override
	public List<AdminReviewMngtVo> selectDashboardBizReview() {
		return dao.selectDashboardBizReview();
	}

	// 질문/답변 리스트
	@Override
	public List<AdminQnaMngtVo> selectDashBoardQna() {
		return dao.selectDashBoardQna();
	}

	// 신고 리스트
	@Override
	public List<AdminReviewMngtVo> selectDashBoardReviewReport() {
		return dao.selectDashBoardReviewReport();
	}
	
	// 가입자 수
	@Override
	public int selectDashBoardPlanOrderCount() {
		return dao.selectDashBoardPlanOrderCount();
	}
	
	// 통신사 신청 수
	@Override
	public int selectDashBoardBizWriteCount() {
		return dao.selectDashBoardBizWriteCount();
	}

	// 통신사 총 등록 수
	@Override
	public int selectDashBoardBizTotalCount() {
		return dao.selectDashBoardBizTotalCount();
	}
	
	

}

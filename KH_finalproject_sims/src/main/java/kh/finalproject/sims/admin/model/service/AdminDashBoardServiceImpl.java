package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminDashBoardDao;
import kh.finalproject.sims.admin.model.vo.AdminDashBoardVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Service
public class AdminDashBoardServiceImpl implements AdminDashBoardService {
	@Autowired
	AdminDashBoardDao dao;
	
	// 리뷰 리스트
	@Override
	public List<AdminReviewMngtVo> selectDashboardBizReview() throws Exception {
		return dao.selectDashboardBizReview();
	}

	// 질문/답변 리스트
	@Override
	public List<AdminQnaMngtVo> selectDashBoardQna() throws Exception {
		return dao.selectDashBoardQna();
	}

	// 신고 리스트
	@Override
	public List<AdminReviewMngtVo> selectDashBoardReviewReport() throws Exception {
		return dao.selectDashBoardReviewReport();
	}
	
	// 가입자 수
	@Override
	public int selectDashBoardPlanOrderCount() throws Exception {
		return dao.selectDashBoardPlanOrderCount();
	}
	
	// 통신사 신청 수
	@Override
	public int selectDashBoardBizWriteCount() throws Exception {
		return dao.selectDashBoardBizWriteCount();
	}

	// 통신사 총 등록 수
	@Override
	public int selectDashBoardBizTotalCount() throws Exception {
		return dao.selectDashBoardBizTotalCount();
	}

	// 요금제별 가입신청 수
	@Override
	public List<AdminDashBoardVo> selectDashBoardPlanOrderChart() throws Exception {
		return dao.selectDashBoardPlanOrderChart();
	}

	// 일별 총 가입자 수 변화
	@Override
	public List<AdminDashBoardVo> selectDashBoardDailyTotalUserWriteCount() throws Exception {
		return dao.selectDashBoardDailyTotalUserWriteCount();
	}
	
	

}

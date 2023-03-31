package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminDashBoardDao;
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

}

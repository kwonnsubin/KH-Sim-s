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
	
	@Override
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return dao.selectReviewReportList();
	}

}

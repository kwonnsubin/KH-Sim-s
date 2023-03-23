package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

public interface AdminReviewMngtService {
	
	public List<AdminReviewMngtVo> selectReviewReportList();
}

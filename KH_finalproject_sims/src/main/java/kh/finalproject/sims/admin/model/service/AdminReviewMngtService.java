package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

public interface AdminReviewMngtService {
	
	// 신고리뷰목록
	public List<AdminReviewMngtVo> selectReviewReportList();
	
	// 신고리뷰상세
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo);
}

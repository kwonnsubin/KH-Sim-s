package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

// 신고리뷰
public interface AdminReviewReportMngtService {
	
	// 목록
	public List<AdminReviewMngtVo> selectReviewReportList();
	
	// 검색
	public List<AdminReviewMngtVo> selectSearchReviewReportList(AdminReviewMngtVo vo);
	
	// 상세
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo);
	
	// 처리(반려/삭제)
	public int updateReviewReportStatus(AdminReviewMngtVo vo);
	
	// 페이징 search
	public Search getPage(int pNum, int cnt, String keyword, String searchType, String reportStatus);
}

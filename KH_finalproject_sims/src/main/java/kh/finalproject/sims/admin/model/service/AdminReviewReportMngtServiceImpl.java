package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminReviewReportMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewReportMngtVo;
import kh.finalproject.sims.common.page.Search;

@Service
// 신고리뷰
public class AdminReviewReportMngtServiceImpl implements AdminReviewReportMngtService{
	@Autowired 
	AdminReviewReportMngtDao dao;
	
	// 목록
	@Override
	public List<AdminReviewMngtVo> selectReviewReportList() throws Exception {
		return dao.selectReviewReportList();
	}
	
	// 검색
	@Override
	public List<AdminReviewMngtVo> selectSearchReviewReportList(AdminReviewMngtVo vo) throws Exception {
		return dao.selectSearchReviewReportList(vo);
	}

	// 상세
	@Override
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo) throws Exception {
		return dao.selectReviewReportDetail(reviewNo);
	}

	// 처리(반려/삭제)
	@Override
	public int updateReviewReportStatus(AdminReviewMngtVo vo) throws Exception {
		
		// 숨김
		dao.updateReviewHidden(vo);
		
		return dao.updateReviewReportStatus(vo);
	}
	
	// 페이징 search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType, String reportStatus) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("reportStatus", reportStatus);
		
		List<AdminReviewReportMngtVo> dataList = dao.searchReviewReportPageList(map); 
		
		int totalRowCount = dao.getSearchReviewReportListCnt(map);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; 
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType);
		search.setTotalRowCount(totalRowCount);
		
		return search; 
	}
	
}

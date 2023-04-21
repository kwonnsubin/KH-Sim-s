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
	public List<AdminReviewMngtVo> selectReviewReportList() {
		return dao.selectReviewReportList();
	}
	
	// 검색
	@Override
	public List<AdminReviewMngtVo> selectSearchReviewReportList(AdminReviewMngtVo vo) {
		return dao.selectSearchReviewReportList(vo);
	}

	// 상세
	@Override
	public AdminReviewMngtVo selectReviewReportDetail(int reviewNo) {
		return dao.selectReviewReportDetail(reviewNo);
	}

	// 처리(반려/삭제)
	@Override
	public int updateReviewReportStatus(AdminReviewMngtVo vo) {
		
		// 숨김
		dao.updateReviewHidden(vo);
		
		return dao.updateReviewReportStatus(vo);
	}
	
	// 페이징 search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType, String reportStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("reportStatus", reportStatus);
		
		List<AdminReviewReportMngtVo> dataList = dao.searchReviewReportPageList(map); // 한 페이지의 글 목록
		
		int totalRowCount = dao.getSearchReviewReportListCnt(map); // 글목록 총 개수를 알아야한다.
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; // 그래야지만 총 페이지수를 구할수있으니깐!
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType); // 페이징 처리해달라고함.
		
		return search; // 반환받은 결과 리턴
	}
	
}

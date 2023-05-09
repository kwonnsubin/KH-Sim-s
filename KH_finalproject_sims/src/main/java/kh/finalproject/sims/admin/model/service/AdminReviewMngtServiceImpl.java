package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminReviewMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

@Service
// 리뷰
public class AdminReviewMngtServiceImpl implements AdminReviewMngtService{
	@Autowired
	AdminReviewMngtDao dao;
	
	// 목록
	@Override
	public List<AdminReviewMngtVo> selectReviewList() throws Exception {
		return dao.selectReviewList();
	}
	
	// 검색
	@Override
	public List<AdminReviewMngtVo> selectSearchReviewList(AdminReviewMngtVo vo) throws Exception {
		return dao.selectSearchReviewList(vo);
	}
	
	// 삭제
	@Override
	public int deleteReview(int reviewNo) throws Exception {
		return dao.deleteReview(reviewNo);
	}
	
	// 상세내용
	@Override
	public AdminReviewMngtVo selectReviewDetail(int reviewNo) throws Exception {
		return dao.selectReviewDetail(reviewNo);
	}
	
	// search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		List<AdminReviewMngtVo> dataList = dao.searchReviewPageList(map); 
		
		int totalRowCount = dao.getSearchReviewListCnt(map);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType);
		search.setTotalRowCount(totalRowCount); // 역순
		
		return search;
	}



}

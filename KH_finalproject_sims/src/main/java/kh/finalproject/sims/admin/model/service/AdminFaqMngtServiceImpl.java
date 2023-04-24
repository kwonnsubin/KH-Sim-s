package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminFaqMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.common.page.Search;

// 자주묻는질문
@Service
public class AdminFaqMngtServiceImpl implements AdminFaqMngtService{
	
	@Autowired
	AdminFaqMngtDao dao;
	
	// 목록보기 
	@Override
	public List<AdminFaqVo> selectFaqList() {
		return dao.selectFaqList();
	}

	// 상세보기
	@Override
	public AdminFaqVo selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}
	
	// 작성
	@Override
	public int insertFaqWrite(AdminFaqVo vo) {
		return dao.insertFaqWrite(vo);
	}
	
	// 수정
	@Override
	public int selectFaqModify(AdminFaqVo vo) {
		return dao.selectFaqModify(vo);
	}
	
	// 삭제
	@Override
	public int deleteFaq(int faqNo) {
		return dao.deleteFaq(faqNo);
	}
	
	// search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		List<AdminFaqVo> dataList = dao.searchFaqPageList(map);
		
		int totalRowCount = dao.getSearchFaqListCnt(map); 
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; 
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType); 
		
		return search; 
	}
	
	// 검색
	@Override
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) {
		return null;
	}
}

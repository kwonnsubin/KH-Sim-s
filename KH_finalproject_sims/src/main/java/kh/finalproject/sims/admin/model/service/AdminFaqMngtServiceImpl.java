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
	
	// 페이징 search 여기서 두개 호출함.
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		List<AdminFaqVo> dataList = dao.searchFaqPageList(map); // 한 페이지의 글 목록
		
		int totalRowCount = dao.getSearchFaqListCnt(); // 글목록 총 개수를 알아야한다.
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; // 그래야지만 총 페이지수를 구할수있으니깐!
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType); // 페이징 처리해달라고함.
		
		return search; // 반환받은 결과 리턴
	}
	
	// 검색
	@Override
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) {
		return null;
	}
}

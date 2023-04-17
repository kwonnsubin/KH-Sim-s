package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.admin.model.dao.AdminQnaMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

@Service
public class AdminQnaMngtServiceImpl implements AdminQnaMngtService{
	@Autowired
	AdminQnaMngtDao dao;
	
	// 자주묻는질문 목록
	@Override
	public List<AdminFaqVo> selectFaqList() {
		return dao.selectFaqList();
	}

	// 자주묻는질문 상세보기
	@Override
	public AdminFaqVo selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}

	@Override
	public int insertFaqWrite(AdminFaqVo vo) {
		return dao.insertFaqWrite(vo);
	}

	@Override
	public int selectFaqModify(AdminFaqVo vo) {
		return dao.selectFaqModify(vo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return dao.deleteFaq(faqNo);
	}
	
	// 페이징 search
	@Override
	public Search getPage(int pNum, int cnt, String searchBox) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("searchBox", searchBox);
		
		List<AdminFaqVo> dataList = dao.searchFaqPageList(map); // 한 페이지의 글 목록
		
		int totalRowCount = dao.searchFaqPageList(); // 글목록 총 개수를 알아야한다.
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod; // 그래야지만 총 페이지수를 구할수있으니깐!
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, searchBox); // 페이징 처리해달라고함.
		
		return search; // 반환받은 결과 리턴
	}
	
//	@Override
//	public Search getPage(int pNum, int cnt, String searchBox) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("start", (pNum - 1) * cnt + 1);
//		map.put("end", pNum * cnt);	
//		map.put("searchBox", searchBox);
//		
//		Map<String, String> mapCnt = new HashMap<String, String>();
//		mapCnt.put("bizid", bizid);
//		mapCnt.put("keyword", keyword);
//		
//		// 총 페이지 수 구하기
//		int totalRowCount = dao.getSearchPlanListCount(mapCnt); // 게시판 글의 총 갯수를 알아야한다.
//		int mod = totalRowCount % cnt == 0 ? 0 : 1;
//		int pageCount = (totalRowCount / cnt) + mod; // 총 페이지수
//		
//		// 페이지의 글목록 조회
//		List<BizPlanMngtVo>data = dao.searchBizPlanList(map);
//		Search search = new Search(data, pNum, pageCount, cnt, 5, searchBox); // 한 페이지의 글목록, 현재페이지, 총 페이지수, 옵션값, 5, 검색단어  
//		
//		return search;
//	}

	
	// 자주묻는질문 조회
	@Override
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo) {
		return dao.selectSearchFaqList(vo);
	}

	// 문의 내역 리스트
	@Override
	public List<AdminQnaMngtVo> selectQnaList() {
		return dao.selectQnaList();
	}
	
	// 문의 내역 검색
	@Override
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) {
		return dao.selectSearchQnaList(vo);
	}

	// 문의 내역 상세보기
	@Override
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) {
		return dao.selectQnaListDetail(aqNo);
	}

	// 문의 내역 답변 리스트 ajax
	@Override
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) {
		return dao.selectQnaAnsList(aqNo);
	}
	
	// 문의 답변 작성 ajax
	@Override
	@Transactional
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) {
		dao.upAnswerCount(vo.getAaNo());
		return dao.insertQnaAnsWrite(vo);
	}
	
	// 문의 답글 작성 ajax
	@Override
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) {
		return dao.insertQnaReplyWrite(vo);
	}

	// 문의 답변 삭제 ajax
	@Override
	@Transactional
	public int deleteQnaAns(int aaNo) {
		dao.downAnswerCount(aaNo);
		return dao.deleteQnaAns(aaNo);
	}

	// 문의 댓글 수정
	@Override
	public int updateQnaAns(AdminQnaAnsVo vo) {
		return dao.updateQnaAns(vo);
	}

	// 문의 답글 리스트 ajax
	@Override
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) {
		return dao.selectQnaReplyList(aaNo);
	}
	
	// 문의 답글 등록 ajax
	@Override
	public int insertReply(AdminQnaReplyVo vo) {
		return dao.insertReply(vo);
	}
	
	// 문의 답글 수정 ajax
	@Override
	public int updateQnaReply(AdminQnaReplyVo vo) {
		return dao.updateQnaReply(vo);
	}
	
	// 문의 답글 삭제 ajax
	@Override
	public int deleteQnaReply(int rplNo) {
		return dao.deleteQnaReply(rplNo);
	}

	// 답변수 조회 ajax
	@Override
	public int selectAnswerCount(int aqNo) {
		return dao.selectAnswerCount(aqNo);
	}

	// 조회수 증가
	@Override
	public int viewUp(int aqNo) {
		return dao.viewUp(aqNo);
	}

	// 조회수 조회 ajax
	@Override
	public int selectViewCount(int aqNo) {
		return dao.selectViewCount(aqNo);
	}



}

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
// 문의내역
public class AdminQnaMngtServiceImpl implements AdminQnaMngtService{
	@Autowired
	AdminQnaMngtDao dao;
	
	// 리스트
	@Override
	public List<AdminQnaMngtVo> selectQnaList() {
		return dao.selectQnaList();
	}
	
	// 검색
	@Override
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) {
		return dao.selectSearchQnaList(vo);
	}

	// 상세보기
	@Override
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) {
		return dao.selectQnaListDetail(aqNo);
	}

	// 답변 리스트 ajax
	@Override
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) {
		return dao.selectQnaAnsList(aqNo);
	}
	
	// 답변 작성 ajax
	@Override
	@Transactional
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) {
		dao.upAnswerCount(vo.getAaNo());
		return dao.insertQnaAnsWrite(vo);
	}
	
	// 답글 작성 ajax
	@Override
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) {
		return dao.insertQnaReplyWrite(vo);
	}

	// 답변 삭제 ajax
	@Override
	@Transactional
	public int deleteQnaAns(int aaNo) {
		dao.downAnswerCount(aaNo);
		return dao.deleteQnaAns(aaNo);
	}

	// 답변 수정
	@Override
	public int updateQnaAns(AdminQnaAnsVo vo) {
		return dao.updateQnaAns(vo);
	}

	// 답글 리스트 ajax
	@Override
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) {
		return dao.selectQnaReplyList(aaNo);
	}
	
	// 답글 등록 ajax
	@Override
	public int insertReply(AdminQnaReplyVo vo) {
		return dao.insertReply(vo);
	}
	
	// 답글 수정 ajax
	@Override
	public int updateQnaReply(AdminQnaReplyVo vo) {
		return dao.updateQnaReply(vo);
	}
	
	// 답글 삭제 ajax
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
	
	// search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		List<AdminFaqVo> dataList = dao.searchQnaPageList(map);
		
		int totalRowCount = dao.getSearchQnaListCnt(map);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, keyword, searchType);
		
		return search; // 반환받은 결과 리턴
	}

}

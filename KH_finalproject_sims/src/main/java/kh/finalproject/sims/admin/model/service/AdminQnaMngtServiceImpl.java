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
	public List<AdminQnaMngtVo> selectQnaList() throws Exception {
		return dao.selectQnaList();
	}
	
	// 검색
	@Override
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) throws Exception {
		return dao.selectSearchQnaList(vo);
	}

	// 상세보기
	@Override
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) throws Exception {
		return dao.selectQnaListDetail(aqNo);
	}
	
	// 문의글 삭제
	@Override
	public int deleteQnaDetail(int aqNo) throws Exception {
		System.out.println(dao.deleteQnaByAns(aqNo));
		return dao.deleteQnaDetail(aqNo);
	}

	// 답변 리스트 ajax
	@Override
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) throws Exception {
		return dao.selectQnaAnsList(aqNo);
	}
	
	// 답변 작성 ajax
	@Override
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) throws Exception {
		//dao.upAnswerCount(vo.getAaNo());
		return dao.insertQnaAnsWrite(vo); // 답변수 +1 증가 -> 트리거
	}
	
	// 답글 작성 ajax
	@Override
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) throws Exception {
		return dao.insertQnaReplyWrite(vo);
	}

	// 답변 삭제 ajax
	@Override
	public int deleteQnaAns(int aaNo) throws Exception {
		//dao.downAnswerCount(aaNo);
		return dao.deleteQnaAns(aaNo); // 답변수-1 감소 -> 트리거
	}

	// 답변 수정
	@Override
	public int updateQnaAns(AdminQnaAnsVo vo) throws Exception {
		return dao.updateQnaAns(vo);
	}

	// 답글 리스트 ajax
	@Override
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) throws Exception {
		return dao.selectQnaReplyList(aaNo);
	}
	
	// 답글 등록 ajax
	@Override
	public int insertReply(AdminQnaReplyVo vo) throws Exception {
		return dao.insertReply(vo);
	}
	
	// 답글 수정 ajax
	@Override
	public int updateQnaReply(AdminQnaReplyVo vo) throws Exception {
		return dao.updateQnaReply(vo);
	}
	
	// 답글 삭제 ajax
	@Override
	public int deleteQnaReply(int rplNo) throws Exception {
		return dao.deleteQnaReply(rplNo);
	}

	// 답변수 조회 ajax
	@Override
	public int selectAnswerCount(int aqNo) throws Exception {
		return dao.selectAnswerCount(aqNo);
	}

	// 조회수 증가
	@Override
	public int viewUp(int aqNo) throws Exception {
		return dao.viewUp(aqNo);
	}

	// 조회수 조회 ajax
	@Override
	public int selectViewCount(int aqNo) throws Exception {
		return dao.selectViewCount(aqNo);
	}
	
	// search
	@Override
	public Search getPage(int pNum, int cnt, String keyword, String searchType) throws Exception {
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
		search.setTotalRowCount(totalRowCount);
		
		return search; // 반환받은 결과 리턴
	}
}

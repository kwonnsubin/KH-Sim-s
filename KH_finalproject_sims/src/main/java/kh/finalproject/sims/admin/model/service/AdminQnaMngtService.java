package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;
import kh.finalproject.sims.common.page.Search;

// 문의내역
public interface AdminQnaMngtService {
	
	// 리스트
	public List<AdminQnaMngtVo> selectQnaList() throws Exception;
	
	// 검색
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo) throws Exception;
	
	// 상세보기
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) throws Exception;
	
	// 문의글 삭제
	public int deleteQnaDetail(int aqNo) throws Exception;
	
	// 답변 리스트
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) throws Exception;
	
	// 답변 작성
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) throws Exception;
	
	// 답글 작성
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) throws Exception;
	
	// 답글 삭제
	public int deleteQnaAns(int aaNo) throws Exception;
	
	// 답변 수정
	public int updateQnaAns(AdminQnaAnsVo vo) throws Exception;
	
	// 답글 리스트
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo) throws Exception;
	
	// 답글 등록 ajax
	public int insertReply(AdminQnaReplyVo vo) throws Exception;
	
	// 답글 수정 ajax
	public int updateQnaReply(AdminQnaReplyVo vo) throws Exception;
	
	// 답글 삭제 ajax
	public int deleteQnaReply(int rplNo) throws Exception;
	
	// 답변수 조회 ajax
	public int selectAnswerCount(int aqNo) throws Exception;
	
	// 조회수 증가
	public int viewUp(int aqNo) throws Exception;
	
	// 조회수 조회 ajax
	public int selectViewCount(int aqNo) throws Exception;
	
	// search
	public Search getPage(int pNum, int cnt, String keyword, String searchType) throws Exception;
}

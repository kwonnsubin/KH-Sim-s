package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;
import kh.finalproject.sims.common.page.Search;

public interface AdminQnaMngtService {
	
	// 자주묻는질문 
	// 목록보기
	public List<AdminFaqVo> selectFaqList();
	// 상세보기
	public AdminFaqVo selectFaqDetail(int faqNo);	
	// 작성하기
	public int insertFaqWrite(AdminFaqVo vo);
	// 수정하기
	public int selectFaqModify(AdminFaqVo vo);
	// 삭제하기
	public int deleteFaq(int faqNo);
	// 검색
	public List<AdminFaqVo> selectSearchFaqList(AdminFaqVo vo);
	// 자주묻는질문 Paging search
	public Search getPage(int pNum, int cnt, String keyword, String searchType);
	
	// 문의 내역
	// 문의 내역 리스트
	public List<AdminQnaMngtVo> selectQnaList();
	
	// 문의 내역 검색
	public List<AdminQnaMngtVo> selectSearchQnaList(AdminQnaMngtVo vo);
	
	// 문의 내역 상세보기
	public AdminQnaMngtVo selectQnaListDetail(int aqNo);
	
//	// 문의 내역 상세보기 JOIN
//	public List<AdminQnaMngtVo> selectQnaListDetail(int aqNo);
	
	// 문의 내역 답변 리스트
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo);
	
	// 문의 답변 작성
	public int insertQnaAnsWrite(AdminQnaAnsVo vo);
	
	// 문의 댓글 작성
	public int insertQnaReplyWrite(AdminQnaReplyVo vo);
	
	// 문의 내역 댓글 삭제
	public int deleteQnaAns(int aaNo);
	
	// 문의 내역 답변 수정
	public int updateQnaAns(AdminQnaAnsVo vo);
	
	// 문의 내역 답글 리스트
	public List<AdminQnaReplyVo> selectQnaReplyList(int aaNo);
	
	// 문의 내역 답글 등록 ajax
	public int insertReply(AdminQnaReplyVo vo);
	
	// 문의 내역 답글 수정 ajax
	public int updateQnaReply(AdminQnaReplyVo vo);
	
	// 문의 내역 답글 삭제 ajax
	public int deleteQnaReply(int rplNo);
	
	// 답변수 조회 ajax
	public int selectAnswerCount(int aqNo);
	
	// 조회수 증가
	public int viewUp(int aqNo);
	
	// 조회수 조회 ajax
	public int selectViewCount(int aqNo);
}

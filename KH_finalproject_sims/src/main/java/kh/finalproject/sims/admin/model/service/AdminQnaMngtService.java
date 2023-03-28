package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

public interface AdminQnaMngtService {
	
	// 자주묻는질문 목록보기
	public List<AdminQnaMngtVo> selectFaqList();
	
	// 자주묻는질문 상세보기
	public AdminQnaMngtVo selectFaqDetail(int faqNo);
	
	// 자주묻는질문 작성하기
	public int insertFaqWrite(AdminQnaMngtVo vo);
	
	// 자주묻는질문 수정하기
	public int selectFaqModify(AdminQnaMngtVo vo);
	
	// 자주묻는질문 삭제하기
	public int deleteFaq(int faqNo);
	
	// 문의 내역 리스트
	public List<AdminQnaMngtVo> selectQnaList();
	
	// 문의 내역 상세보기
	public AdminQnaMngtVo selectQnaListDetail(int aqNo);
	
//	// 문의 내역 상세보기 JOIN
//	public List<AdminQnaMngtVo> selectQnaListDetail(int aqNo);
	
	// 문의 내역 답변 리스트
	public List<AdminQnaMngtVo> selectQnaAnsList(int aqNo);
	
	// 문의 내역 댓글 리스트
	public List<AdminQnaMngtVo> selectQnaReplyList(int aaNo);
}

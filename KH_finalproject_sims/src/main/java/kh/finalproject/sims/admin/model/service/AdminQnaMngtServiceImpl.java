package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminQnaMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;

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


	// 문의 내역 상세보기
	@Override
	public AdminQnaMngtVo selectQnaListDetail(int aqNo) {
		return dao.selectQnaListDetail(aqNo);
	}

	// 문의 내역 답변 리스트
	@Override
	public List<AdminQnaAnsVo> selectQnaAnsList(int aqNo) {
		return dao.selectQnaAnsList(aqNo);
	}
	
	// 문의 내역 답변 작성
	@Override
	public int insertQnaAnsWrite(AdminQnaAnsVo vo) {
		return dao.insertQnaAnsWrite(vo);
	}
	
	// 문의 내역 댓글 작성
	@Override
	public int insertQnaReplyWrite(AdminQnaReplyVo vo) {
		return dao.insertQnaReplyWrite(vo);
	}

	// 문의 내역 댓글 삭제
	@Override
	public int deleteQnaAns(int aaNo) {
		return dao.deleteQnaAns(aaNo);
	}

	// 문의 내역 댓글 수정
	@Override
	public int updateQnaAns(AdminQnaAnsVo vo) {
		return dao.updateQnaAns(vo);
	}
	
	// 문의 내역 댓글 리스트
//	@Override
//	public List<AdminQnaMngtVo> selectQnaReplyList(int aaNo) {
//		return dao.selectQnaReplyList(aaNo);
//	}
	
//	// 문의 내역 상세보기 JOIN
//	@Override
//	public List<AdminQnaMngtVo> selectQnaListDetail(int aqNo) {
//		return dao.selectQnaListDetail(aqNo);
//	}

}

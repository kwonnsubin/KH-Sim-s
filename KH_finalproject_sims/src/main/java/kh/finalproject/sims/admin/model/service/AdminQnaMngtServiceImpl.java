package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

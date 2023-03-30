package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserFaqDao;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

@Service
public class UserFaqServiceImpl implements UserFaqService {
	
	@Autowired
	UserFaqDao dao;
	
	// 자주묻는질문 목록
	@Override
	public List<UserFaqVo> selectFaqList() {
		return dao.selectFaqList();
	}

	// 자주묻는질문 상세
	@Override
	public List<UserFaqVo> selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}

	// 문의게시판 질문목록
	@Override
	public List<UserQnaVo> selectQnaList() {
		return dao.selectQnaList();
	}

	// 문의게시판 상세
	@Override
	public UserQnaVo selectQnaDetail(int aqNo) {
		return dao.selectQnaDetail(aqNo);
	}
	
	// 문의게시판 답변목록
	@Override
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return dao.selectAnsList(aqNo);
	}

	// 답변달기
	@Override
	public void insertAnswer(int aqNo, UserAnsVo vo) {
		dao.insertAnswer(aqNo, vo);
	}
	
	// 답변 번호로 조회
	@Override
	public UserAnsVo getAnsByNo(int aaNo) {
		return dao.getAnsByNo(aaNo);
	}
	
	// 댓글달기
	@Override
	public void insertReply(int aaNo, UserRplVo vo) {
		dao.insertReply(aaNo, vo);
	}

	// 조회수 증가
	@Override
	public void viewCount(int aqNo) {
		dao.viewCount(aqNo);
	}

	// 질문하기
	@Override
	public void insertQna(UserQnaVo vo) {
		dao.insertQna(vo);
	}

	// 내질문 목록
	@Override
	public List<UserQnaVo> selectMyQnaList(String username) {
		return dao.selectMyQnaList(username);
	}

	// 내답변 목록
	@Override
	public List<UserAnsVo> selectMyAnsList(String username) {
		return dao.selectMyAnsList(username);
	}

	// 내질문 삭제
	@Override
	public int deleteQna(int aqNo) {
		return dao.deleteQna(aqNo);
	}

	// 내답변 삭제
	@Override
	public int deleteAns(int aaNo) {
		return dao.deleteAns(aaNo);
	}
	
	// 댓글 삭제
	@Override
	public int deleteRpl(int rplNo) {
		return dao.deleteRpl(rplNo);
	}

	// 답변수 -1
	@Override
	public void deAnswers(int aqNo) {
		dao.deAnswers(aqNo);
	}
	
	// 답변수 +1
	@Override
	public void upAnswers(int aqNo) {
		dao.upAnswers(aqNo);
	}

	// 질문 수정
	@Override
	public int updateQna(UserQnaVo vo) {
		return dao.updateQna(vo);
	}

	// 답변 수정
	@Override
	public int updateAns(UserAnsVo vo) {
		return dao.updateAns(vo);
	}

	// 댓글 번호로 조회
	@Override
	public UserRplVo getRplByNo(int rplNo) {
		return dao.getRplByNo(rplNo);
	}
}

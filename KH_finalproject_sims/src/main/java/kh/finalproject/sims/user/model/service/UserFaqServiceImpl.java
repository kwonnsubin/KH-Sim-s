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
	
	// 자주묻는질문 목록/조회
	@Override
	public List<UserFaqVo> selectFaqList() {
		return dao.selectFaqList();
	}
	
	@Override
	public List<UserFaqVo> selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}
	

	// 질문 목록/조회/작성/삭제/수정
	@Override
	public List<UserQnaVo> selectQnaList() {
		return dao.selectQnaList();
	}

	@Override
	public UserQnaVo selectQnaDetail(int aqNo) {
		return dao.selectQnaDetail(aqNo);
	}

	@Override
	public void insertQna(UserQnaVo vo) {
		dao.insertQna(vo);
	}

	@Override
	public int deleteQna(int aqNo) {
		return dao.deleteQna(aqNo);
	}

	@Override
	public int updateQna(UserQnaVo vo) {
		return dao.updateQna(vo);
	}
	
	// 답변 목록/조회/작성/삭제/수정
	@Override
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return dao.selectAnsList(aqNo);
	}
	
	@Override
	public UserAnsVo getAnsByNo(int aaNo) {
		return dao.getAnsByNo(aaNo);
	}

	@Override
	public void insertAnswer(int aqNo, UserAnsVo vo) {
		dao.insertAnswer(aqNo, vo);
	}
	
	@Override
	public int deleteAns(int aaNo) {
		return dao.deleteAns(aaNo);
	}

	@Override
	public int updateAns(UserAnsVo vo) {
		return dao.updateAns(vo);
	}
	
	// 댓글 조회/작성/삭제/수정
	@Override
	public UserRplVo getRplByNo(int rplNo) {
		return dao.getRplByNo(rplNo);
	}
	@Override
	public void insertReply(int aaNo, UserRplVo vo) {
		dao.insertReply(aaNo, vo);
	}
	@Override
	public int deleteRpl(int rplNo) {
		return dao.deleteRpl(rplNo);
	}
	@Override
	public int updateRpl(UserRplVo vo) {
		return dao.updateRpl(vo);
	}

	// 아이디로 조회한 질문/답변 목록
	@Override
	public List<UserQnaVo> selectMyQnaList(String username) {
		return dao.selectMyQnaList(username);
	}

	@Override
	public List<UserAnsVo> selectMyAnsList(String username) {
		return dao.selectMyAnsList(username);
	}
	
	// 조회수 증가
	@Override
	public void viewCount(int aqNo) {
		dao.viewCount(aqNo);
	}

	// 답변수 -1/+1
	@Override
	public void deAnswers(int aqNo) {
		dao.deAnswers(aqNo);
	}
	
	@Override
	public void upAnswers(int aqNo) {
		dao.upAnswers(aqNo);
	}




}

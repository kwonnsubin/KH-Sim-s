package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<UserQnaVo> searchQnaList(UserQnaVo vo) {
		return dao.searchQnaList(vo);
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
	@Transactional
	public boolean insertAnswer(int aqNo, UserAnsVo vo) {
		int count = dao.insertAnswer(aqNo, vo);
		return count > 0;
	}
	
	@Override
	@Transactional
	public boolean deleteAns(int aaNo) {
		int count = dao.deleteAns(aaNo);
		return count > 0;
	}

	@Override
	@Transactional
	public boolean updateAns(UserAnsVo vo) {
		int count = dao.updateAns(vo);
		return count > 0;
	}
	
	// 댓글 조회/작성/삭제/수정
	@Override
	public UserRplVo getRplByNo(int rplNo) {
		return dao.getRplByNo(rplNo);
	}
	@Override
	@Transactional
	public boolean insertReply(int aaNo, UserRplVo vo) {
		int count = dao.insertReply(aaNo, vo);
		return count > 0;
	}
	@Override
	@Transactional
	public boolean deleteRpl(int rplNo) {
		return dao.deleteRpl(rplNo) > 0;
	}
	@Override
	@Transactional
	public boolean updateRpl(UserRplVo vo) {
		return dao.updateRpl(vo) > 0;
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
	@Transactional
	public boolean deAnswers(int aqNo) {
		return dao.deAnswers(aqNo) > 0;
	}
	
	@Override
	@Transactional
	public boolean upAnswers(int aqNo) {
	    int count = dao.upAnswers(aqNo);
	    return count > 0;
	}

	

}

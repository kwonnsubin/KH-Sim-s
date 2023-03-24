package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserFaqDao;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;

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
	public List<UserQnaVo> selectQnaDetail(int aqNo) {
		return dao.selectQnaDetail(aqNo);
	}
	
	// 문의게시판 답변목록
	@Override
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return dao.selectAnsList(aqNo);
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

}

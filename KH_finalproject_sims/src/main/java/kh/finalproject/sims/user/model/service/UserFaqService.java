package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;

public interface UserFaqService {

	// 자주묻는질문 목록
	public List<UserFaqVo> selectFaqList();
	
	// 자주묻는질문 상세
	public List<UserFaqVo> selectFaqDetail(int faqNo);

	// 문의게시판 질문목록
	public List<UserQnaVo> selectQnaList();

	// 문의게시판 상세
	public List<UserQnaVo> selectQnaDetail(int aqNo);
	
	// 조회수 증가
	public void viewCount(int aqNo);

}

package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

public interface UserFaqService {

	// 자주묻는질문 목록
	public List<UserFaqVo> selectFaqList();
	
	// 자주묻는질문 상세
	public List<UserFaqVo> selectFaqDetail(int faqNo);

	// 문의게시판 질문목록
	public List<UserQnaVo> selectQnaList();

	// 문의게시판 상세
	public UserQnaVo selectQnaDetail(int aqNo);
	
	// 문의게시판 답변목록
	public List<UserAnsVo> selectAnsList(int aqNo);
	
	// 답변달기
	public void insertAnswer(int aqNo, UserAnsVo vo);
	
	// 답변 번호로 조회
	public UserAnsVo getAnsByNo(int aaNo);
	
	// 댓글달기
	public void insertReply(int aaNo, UserRplVo vo);
	
	// 조회수 증가
	public void viewCount(int aqNo);

	// 질문하기
	public void insertQna(UserQnaVo vo);

	// 내질문 목록
	public List<UserQnaVo> selectMyQnaList(String username);

	// 내답변 목록
	public List<UserAnsVo> selectMyAnsList(String username);

	// 내질문 삭제
	public int deleteQna(int aqNo);

	// 내답변 삭제
	public int deleteAns(int aaNo);

	// 답변수 -1
	public void deAnswers(int aqNo);

	// 질문 수정
	public int updateQna(UserQnaVo vo);

	// 답변수 +1
	public void upAnswers(int aqNo);

}

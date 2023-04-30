package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.common.page.Search;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

public interface UserFaqService {

	// 자주묻는질문 목록/조회
	public List<UserFaqVo> selectFaqList();
	public UserFaqVo selectFaqDetail(int faqNo);

	// 질문 조회/작성/삭제/수정
	public UserQnaVo selectQnaDetail(int aqNo);
	public void insertQna(UserQnaVo vo);
	public int deleteQna(int aqNo);
	public int updateQna(UserQnaVo vo);
	
	// 답변 목록/조회/작성/삭제/수정
	public List<UserAnsVo> selectAnsList(int aqNo);
	public UserAnsVo getAnsByNo(int aaNo);
	public int insertAnswer(int aqNo, UserAnsVo vo);
	public int deleteAns(int aaNo);
	public boolean updateAns(UserAnsVo vo);
	
	// 댓글 조회/작성/삭제/수정
	public UserRplVo getRplByNo(int rplNo);
	public int insertReply(int aaNo, UserRplVo vo);
	public boolean deleteRpl(int rplNo);
	public int updateRpl(UserRplVo vo);

	// 아이디로 조회한 질문/답변 목록
	public List<UserQnaVo> selectMyQnaList(String username);
	public List<UserAnsVo> selectMyAnsList(String username);
	
	// 조회수 증가
	public void viewCount(int aqNo);

	// 답변수 -1/+1
	public boolean deAnswers(int aqNo);
	public boolean upAnswers(int aqNo);
	
	// search 목록
	public Search getPage(int pNum, int cnt, String searchType, String keyword);
	public int getSearchListCount(String searchType, String keyword);

}

package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.common.page.Search;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

public interface UserFaqService {

	// 자주묻는질문 목록/조회
	public List<UserFaqVo> selectFaqList() throws Exception;
	public UserFaqVo selectFaqDetail(int faqNo) throws Exception;

	// 질문 조회/작성/삭제/수정
	public UserQnaVo selectQnaDetail(int aqNo) throws Exception;
	public void insertQna(UserQnaVo vo) throws Exception;
	public int deleteQna(int aqNo) throws Exception;
	public int updateQna(UserQnaVo vo) throws Exception;
	
	// 답변 목록/조회/작성/삭제/수정
	public List<UserAnsVo> selectAnsList(int aqNo) throws Exception;
	public UserAnsVo getAnsByNo(int aaNo) throws Exception;
	public int insertAnswer(int aqNo, UserAnsVo vo) throws Exception;
	public int deleteAns(int aaNo) throws Exception;
	public boolean updateAns(UserAnsVo vo) throws Exception;
	
	// 댓글 조회/작성/삭제/수정
	public UserRplVo getRplByNo(int rplNo) throws Exception;
	public int insertReply(int aaNo, UserRplVo vo) throws Exception;
	public boolean deleteRpl(int rplNo) throws Exception;
	public int updateRpl(UserRplVo vo) throws Exception;

	// 아이디로 조회한 질문/답변 목록
	public List<UserQnaVo> selectMyQnaList(String username) throws Exception;
	public List<UserAnsVo> selectMyAnsList(String username) throws Exception;
	
	// 조회수 증가
	public void viewCount(int aqNo) throws Exception;

	// 답변수 -1/+1
	public boolean deAnswers(int aqNo) throws Exception;
	public boolean upAnswers(int aqNo) throws Exception;
	
	// search 목록
	public Search getPage(int pNum, int cnt, String searchType, String keyword) throws Exception;
	public int getSearchListCount(String searchType, String keyword) throws Exception;

}

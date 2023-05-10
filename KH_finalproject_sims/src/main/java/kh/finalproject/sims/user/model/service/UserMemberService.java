package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMemberService {

	// 아이디 중복체크
	public int selectIdCheck(String id) throws Exception;
	
	// 유저 회원가입
	public int insertUserSignUp(MemberVo memVo, UserMemberVo userVo) throws Exception;

	// 통신사 회원가입
	public int insertBizSignUp(MemberVo memVo, BizInfoMngtVo bizVo) throws Exception;

	// 유저 이름에 대한 아이디 찾기
	public MemberVo selectFindId(UserMemberVo userVo) throws Exception;

	// 통신사 이름에 대한 아이디 찾기
	public MemberVo selectFindId(BizInfoMngtVo bizVo) throws Exception;

	// 유저 아이디에 대한 계정 정보 유무
	public MemberVo selectFindPw(UserMemberVo userVo) throws Exception;

	// 통신사 아이디에 대한 계정 정보 유무
	public int selectFindPw(BizInfoMngtVo bizVo) throws Exception;

	// 비밀번호 재설정
	public int changePw(MemberVo memVo) throws Exception;
	
	// 계정 복구
	public int updateEnable(String id) throws Exception;
	
	// 카카오 로그인
	public void kakaoJoin(MemberVo memberVo, UserMemberVo userMemberVo) throws Exception;

	public MemberVo kakaoLogin(String snsId) throws Exception;

	public MemberVo findByUserId(String snsId) throws Exception;

	// 로그인한 이름
	public String getUserName(String userId) throws Exception;

	// 로그인한 통신사 이름
	public String getBizName(String bizId) throws Exception;
	
}

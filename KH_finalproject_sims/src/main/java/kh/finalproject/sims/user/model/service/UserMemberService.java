package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMemberService {

	// 아이디 중복체크
	public int selectIdCheck(String id);
	
	// 유저 회원가입
	public int insertUserSignUp(MemberVo memVo, UserMemberVo userVo);

	// 통신사 회원가입
	public int insertBizSignUp(MemberVo memVo, BizInfoMngtVo bizVo);

	// 유저 이름에 대한 아이디 찾기
	public MemberVo selectFindId(UserMemberVo userVo);

	// 통신사 이름에 대한 아이디 찾기
	public MemberVo selectFindId(BizInfoMngtVo bizVo);

	// 유저 아이디에 대한 계정 정보 유무
	public int selectFindPw(UserMemberVo userVo);

	// 통신사 아이디에 대한 계정 정보 유무
	public int selectFindPw(BizInfoMngtVo bizVo);

	// 비밀번호 재설정
	public int changePw(MemberVo memVo);

	// 계정 복구
	public int updateEnable(String id);

	// 마이페이지
	public UserMemberVo selectMyPageInfo(String id);

	// 유저 정보 수정
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo);

	public int updateDisable(String id);
	
}

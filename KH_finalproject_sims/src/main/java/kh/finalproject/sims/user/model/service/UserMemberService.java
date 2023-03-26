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
	
}

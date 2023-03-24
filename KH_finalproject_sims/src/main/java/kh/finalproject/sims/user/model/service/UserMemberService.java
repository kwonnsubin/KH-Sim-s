package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMemberService {

	public int selectIdCheck(String id);
	
	public int insertSignUp(MemberVo memVo, UserMemberVo userVo);
	
}

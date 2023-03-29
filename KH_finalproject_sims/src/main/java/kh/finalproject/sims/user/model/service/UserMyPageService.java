package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMyPageService {

	// 계정 탈퇴
	public int updateDisable(String id);
	
	// 마이페이지
	public UserMemberVo selectMyPageInfo(String id);

	// 유저 정보 수정
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo);
	
}

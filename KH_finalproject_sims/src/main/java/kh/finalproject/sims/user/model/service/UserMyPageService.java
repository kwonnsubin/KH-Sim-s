package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMyPageService {

	// 계정 탈퇴
	public int updateDisable(String id);
	
	// 마이페이지
	public UserMemberVo selectMyPageInfo(String id);

	// 유저 정보 수정
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo);

	// 공지사항 리스트
	public List<AdminNoticeMngtVo> selectNoticeList();

	// 공지사항 내용
	public AdminNoticeMngtVo selectNoticeDetail(int number);
	
}

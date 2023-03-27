package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;

public interface AdminUserMngtService {
	
	//관리자의 사용자 관리 리스트
	public List<AdminUserMngtVo> selectUserList(AdminUserMngtVo vo);

	//관리자의 사용자 관리 상세정보/수정페이지 호출
	public AdminUserMngtVo selectUserDetail(String userId);

}

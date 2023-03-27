package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;

public interface AdminUserMngtService {
	
	//관리자의 사용자 관리 리스트
	public List<AdminUserMngtVo> selectUserList(AdminUserMngtVo vo);

}

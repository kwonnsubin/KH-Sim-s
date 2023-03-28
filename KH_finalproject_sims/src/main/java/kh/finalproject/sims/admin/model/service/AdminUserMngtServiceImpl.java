package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminUserMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;

@Service
public class AdminUserMngtServiceImpl implements AdminUserMngtService{
	
	@Autowired
	private AdminUserMngtDao dao;
	
		//관리자의 사용자 관리 리스트
		@Override
		public List<AdminUserMngtVo> selectUserList(AdminUserMngtVo vo) {
			return dao.selectUserList(vo);
		}

		//관리자의 사용자 관리 상세
		@Override
		public AdminUserMngtVo selectUserDetail(String userId) {
			return dao.selectUserDetail(userId);
		}

		//관리자의 사용자 관리 수정 저장
		@Override
		public int saveUserModify(AdminUserMngtVo vo) {
			return dao.saveUserModify(vo);
		}
	
		

	

}

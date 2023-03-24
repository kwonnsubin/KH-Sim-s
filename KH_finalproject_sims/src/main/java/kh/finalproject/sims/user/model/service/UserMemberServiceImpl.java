package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.user.model.dao.UserMemberDao;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Service
public class UserMemberServiceImpl implements UserMemberService {

	@Autowired
	private UserMemberDao dao;
	
	@Override
	public int selectIdCheck(String id) {
		
		return dao.selectIdCheck(id);
	}

	@Override
	@Transactional
	public int insertSignUp(MemberVo memVo, UserMemberVo userVo) {
		int signUpMember = dao.signUpMember(memVo);
		
		int result = 0;
		if(signUpMember == 1) {
			result = dao.signUpUser(userVo);
		}
		
		return result;
	}

}

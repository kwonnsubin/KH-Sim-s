package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserMemberDao;

@Service
public class UserMemberServiceImpl implements UserMemberService {

	@Autowired
	private UserMemberDao dao;
	
	@Override
	public int selectIdCheck(String id) {
		
		return dao.selectIdCheck(id);
	}

}

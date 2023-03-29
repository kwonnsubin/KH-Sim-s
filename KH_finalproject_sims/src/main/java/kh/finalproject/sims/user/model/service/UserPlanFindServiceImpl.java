package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserPlanFindDao;

@Service
public class UserPlanFindServiceImpl implements UserPlanFindService {
	
	@Autowired
	private UserPlanFindDao dao;

}

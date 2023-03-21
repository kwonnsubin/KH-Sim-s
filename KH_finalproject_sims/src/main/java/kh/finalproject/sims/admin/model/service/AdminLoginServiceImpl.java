package kh.finalproject.sims.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminLoginDao;
import kh.finalproject.sims.admin.model.vo.AdminLoginVo;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	@Autowired
	private AdminLoginDao dao;

	@Override
	public AdminLoginVo doLogin(AdminLoginVo vo) {
		return dao.doLogin(vo);
	}

}

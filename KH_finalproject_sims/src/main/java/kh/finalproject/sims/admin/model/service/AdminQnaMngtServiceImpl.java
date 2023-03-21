package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminQnaMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

@Service
public class AdminQnaMngtServiceImpl implements AdminQnaMngtService{
	@Autowired
	AdminQnaMngtDao dao;
	
	@Override
	public List<AdminQnaMngtVo> selectFaqList() {
		return dao.selectQnaList();
	}

}

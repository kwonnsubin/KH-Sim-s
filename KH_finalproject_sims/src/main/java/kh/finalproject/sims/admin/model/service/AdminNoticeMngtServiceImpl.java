package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.admin.model.dao.AdminNoticeMngtDao;

@Service
public class AdminNoticeMngtServiceImpl implements AdminNoticeMngtService{

	@Autowired
	private AdminNoticeMngtDao dao;
	
	@Override
	public List<AdminNoticeMngtVo> selectNoticeList(){
		return dao.selectNoticeList();
	}
	
	
}

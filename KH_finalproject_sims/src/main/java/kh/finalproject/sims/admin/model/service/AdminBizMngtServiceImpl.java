package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminBizMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;

@Service
public class AdminBizMngtServiceImpl implements AdminBizMngtService{
	
	@Autowired
	private AdminBizMngtDao dao;

	//통신사 신청 정보 리스트
	@Override
	public List<AdminBizMngtVo> selectBizApplyList(AdminBizMngtVo vo) {
		return dao.selectBizApplyList(vo);
	}
	

}

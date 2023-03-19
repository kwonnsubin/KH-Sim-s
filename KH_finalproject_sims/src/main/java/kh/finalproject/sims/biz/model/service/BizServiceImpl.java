package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizDao;
import kh.finalproject.sims.biz.model.vo.BizVo;
@Service
public class BizServiceImpl implements BizService{
	
	@Autowired
	private BizDao dao;

	@Override
	public List<BizVo> selectList() throws Exception {
		return dao.selectList();
	}
}

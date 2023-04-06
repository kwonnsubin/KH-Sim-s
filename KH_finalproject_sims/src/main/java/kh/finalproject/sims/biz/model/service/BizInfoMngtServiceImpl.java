package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizInfoMngtDao;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;
@Service
public class BizInfoMngtServiceImpl implements BizInfoMngtService{
	
	@Autowired
	private BizInfoMngtDao dao;

	/*
	 * @Override public List<BizInfoMngtVo> selectList() throws Exception { return
	 * dao.selectList(); }
	 */

	@Override
	public BizInfoMngtVo selectBizInfoDetail(String bizid) {
		return dao.selectBizInfoDetail(bizid);
	}

	@Override
	public List<bizInfoMngServiceVo> selectListService(String bizid) {
		return dao.selectListService(bizid);
	}

	@Override
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList) {
		return dao.modifyNetService(netServiceList);
	}

}

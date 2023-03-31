package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizPlanMngtDao;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Service
public class BizPlanMngtServiceImpl implements BizPlanMngtService{
	
	@Autowired
	public BizPlanMngtDao dao;

	@Override
	public List<BizPlanMngtVo> selectBizPlanList(String bizid) {
		return dao.selectBizPlanList(bizid);
	}

	@Override
	public BizPlanMngtVo selectBizPlanDetail(int planNo) {
		return dao.selectBizPlanDetail(planNo);
	}

	@Override
	public int registerBizPlan(BizPlanMngtVo vo) {
		return dao.registerBizPlan(vo);
		
	}
	

}

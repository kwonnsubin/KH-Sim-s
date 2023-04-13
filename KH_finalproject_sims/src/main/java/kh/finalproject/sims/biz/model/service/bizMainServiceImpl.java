package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizMainDao;
import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMainVo;

@Service
public class bizMainServiceImpl implements BizMainService{

	@Autowired
	private BizMainDao dao;
	
	@Override
	public List<BizChartVo> selectJoinPlanByDate(String bizid) {
		return dao.selectJoinPlanByDate(bizid);
	}

	@Override
	public List<BizMainVo> selectTotalApplyByPlan(String bizid) {
		return dao.selectTotalApplyByPlan(bizid);
	}

}

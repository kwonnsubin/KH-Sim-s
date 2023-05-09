
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
	public List<BizChartVo> selectJoinPlanByDate(String bizid)throws Exception {
		return dao.selectJoinPlanByDate(bizid);
	}

	@Override
	public List<BizMainVo> selectTotalApplyByPlan(String bizid)throws Exception {
		return dao.selectTotalApplyByPlan(bizid);
	}


	@Override
	public List<BizMainVo>selectTodayApplyByPlan(String bizid)throws Exception {
		return dao.selectTodayApplyByPlan(bizid);
	}
	
	@Override
	public List<BizMainVo> selectTopPlanAgeRatio(String bizid)throws Exception {
		return dao.selectTopPlanAgeRatio(bizid);
	}

	@Override
	public List<BizMainVo> selectTopPlanGenderRatio(String bizid)throws Exception {
		return dao.selectTopPlanGenderRatio(bizid);
	}

	@Override
	public String selectTopPlanName(String bizid) throws Exception{
		return dao.selectTopPlanName(bizid);
	}

	@Override
	public List<BizMainVo> selectBizAgeRatio(String bizid)throws Exception {
		return dao.selectBizAgeRatio(bizid);	}

	@Override
	public List<BizMainVo> selectBizGenderRatio(String bizid)throws Exception {
		return dao.selectBizGenderRatio(bizid);	}


}

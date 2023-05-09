package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMainVo;

public interface BizMainService {

	public List<BizChartVo>selectJoinPlanByDate(String bizid)throws Exception;
	
	public List<BizMainVo>selectTotalApplyByPlan(String bizid)throws Exception;
	
	public List<BizMainVo>selectTodayApplyByPlan(String bizid)throws Exception;
	
	public List<BizMainVo>selectTopPlanAgeRatio(String bizid)throws Exception;
	
	public List<BizMainVo>selectTopPlanGenderRatio(String bizid)throws Exception;

	public List<BizMainVo>selectBizAgeRatio(String bizid)throws Exception;

	public List<BizMainVo>selectBizGenderRatio(String bizid)throws Exception;
	
	public String selectTopPlanName(String bizid)throws Exception;
}

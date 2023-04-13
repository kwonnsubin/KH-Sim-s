package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMainVo;

public interface BizMainService {

	public List<BizChartVo>selectJoinPlanByDate(String bizid);
	
	public List<BizMainVo>selectTotalApplyByPlan(String bizid);
}

package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanFindService {
	
	public List<PlanVo> selectPlanList();

	public int cntPlanList();

}

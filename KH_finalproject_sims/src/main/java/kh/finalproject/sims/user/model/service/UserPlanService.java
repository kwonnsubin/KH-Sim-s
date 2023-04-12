package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanService {

	public PlanVo getPlanByNo(int planNo);

	public String getNetNameByNetNo(int netNo);

	public String getGenNameByGenNo(int genNo);


}

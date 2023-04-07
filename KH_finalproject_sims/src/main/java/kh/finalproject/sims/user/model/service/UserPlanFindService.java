package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanFindService {
	
	public List<PlanVo> selectPlanList();

	public List<PlanVo> selectPlanList(PlanVo pvo);
	
	public int cntPlanList();

	public List<BizInfoMngtVo> selectBizNameList();

}

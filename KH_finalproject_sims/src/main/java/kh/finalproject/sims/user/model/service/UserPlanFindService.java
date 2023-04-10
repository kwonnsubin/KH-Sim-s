package kh.finalproject.sims.user.model.service;

import java.util.List;
import java.util.Map;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanFindService {
	
	public List<PlanVo> selectPlanList(String searchText);

	public int cntPlanList(String searchText);

	public List<PlanVo> selectPlanList(Map searchMap);
	
	public int cntPlanList(Map searchMap);

	public List<BizInfoMngtVo> selectBizNameList();

	public List<CustomQueVo> selectCustomQueList(String userId);

	public int insertQueVal(Map<String, Object> val);

}

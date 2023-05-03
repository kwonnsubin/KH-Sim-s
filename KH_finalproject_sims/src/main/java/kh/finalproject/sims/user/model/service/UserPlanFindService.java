package kh.finalproject.sims.user.model.service;

import java.util.List;
import java.util.Map;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanFindService {
	
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap);

	public int cntPlanList(Map<String, Object> searchMap);

	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap);
	
	public int cntPlanFilterList(Map<String, Object> searchMap);

	public List<String> selectBizNameList();

	public CustomQueVo selectCustomQueList(String userId);

	public int insertQueVal(Map<String, Object> val);

	public int selectUser(String userId);

	public void insertUser(String userId);

	public List<PlanVo> selectViewRankList();

	public List<PlanVo> selectLikeRankList();

	public List<PlanVo> selectOrderRankList();

	public List<PlanVo> selectBizPlanList(String bizId);

	public List<BizInfoMngtVo> selectBizIdList();

}

package kh.finalproject.sims.user.model.service;

import java.util.List;
import java.util.Map;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanFindService {
	
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap) throws Exception;

	public int cntPlanList(Map<String, Object> searchMap) throws Exception;

	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap) throws Exception;
	
	public int cntPlanFilterList(Map<String, Object> searchMap) throws Exception;

	public List<String> selectBizNameList() throws Exception;

	public CustomQueVo selectCustomQueList(String userId) throws Exception;

	public int insertQueVal(Map<String, Object> val) throws Exception;

	public int selectUser(String userId) throws Exception;

	public void insertUser(String userId) throws Exception;

	public List<PlanVo> selectViewRankList() throws Exception;

	public List<PlanVo> selectLikeRankList() throws Exception;

	public List<PlanVo> selectOrderRankList() throws Exception;

	public List<PlanVo> selectBizPlanList(String bizId) throws Exception;

	public List<BizInfoMngtVo> selectBizIdList() throws Exception;

}

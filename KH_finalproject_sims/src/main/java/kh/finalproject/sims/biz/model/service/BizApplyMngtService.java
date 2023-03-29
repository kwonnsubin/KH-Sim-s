package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser();
	public BizApplyVo selectApplyDetailPlan();
	public int updateApproveStatus();
	public int updateHoldStatus();
	
	public List<BizApplyVo> selectBizPlanApplyList(String bizid);
}

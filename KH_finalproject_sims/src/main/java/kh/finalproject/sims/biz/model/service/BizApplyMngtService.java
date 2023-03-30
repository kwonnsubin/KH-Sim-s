package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser(int orderNo);
	public BizApplyVo selectApplyDetailPlan(int orderNo);
	public int updateApproveStatus(int orderNo);
	public int updateHoldStatus(int orderNo);
	
	public List<BizApplyVo> selectBizPlanApplyList(String bizid);
}

package kh.finalproject.sims.biz.model.service;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser();
	public BizApplyVo selectApplyDetailPlan();
	public int updateApproveStatus();
}

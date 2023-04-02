package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser(int orderNo);
	public BizApplyVo selectApplyDetailPlan(int orderNo);
	public int updateApproveStatus(int orderNo);
	public int updateHoldStatus(int orderNo);
	
	public List<BizApplyVo> selectBizPlanApplyList(String bizid);
	public Paging getPage(String bizid, int pNum, int parseInt);
}

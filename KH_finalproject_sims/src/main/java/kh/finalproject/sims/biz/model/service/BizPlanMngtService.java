package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

public interface BizPlanMngtService {

	public List<BizPlanMngtVo> selectBizPlanList(String bizid);

	public BizPlanMngtVo selectBizPlanDetail(int planNo);

	public int registerBizPlan(BizPlanMngtVo vo);

	public BizPlanMngtVo findByBizName(String bizid);

	public int getPlanListCnt(String bizid);

}

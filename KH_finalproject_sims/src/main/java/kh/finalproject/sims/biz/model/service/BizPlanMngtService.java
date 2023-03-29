package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

public interface BizPlanMngtService {

	public List<BizPlanMngtVo> selectBizPlanList(String bizid);

}

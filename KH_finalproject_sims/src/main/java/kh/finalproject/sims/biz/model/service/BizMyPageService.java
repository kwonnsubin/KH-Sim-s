package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizMyPageVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

public interface BizMyPageService {

	public int getTodayReviewCnt(String bizid)throws Exception;
	
	public int getTotalReviewCnt(String bizid)throws Exception;
	
	public int getTodayApplyCnt(String bizid)throws Exception;
	
	public int getTotalApplyCnt(String bizid)throws Exception;
	
	public int getTotalPlanCnt(String bizid)throws Exception;
	
	public BizMyPageVo getLogo(String bizid)throws Exception;
	
	public List<BizMyPageVo> getRecentReview(String bizid)throws Exception;
	
	public List<BizPlanMngtVo> getTopFivePlanInfo(String bizid)throws Exception;
}

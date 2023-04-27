package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizMyPageVo;

public interface BizMyPageService {

	public int getTodayReviewCnt(String bizid);
	
	public int getTotalReviewCnt(String bizid);
	
	public int getTodayApplyCnt(String bizid);
	
	public int getTotalApplyCnt(String bizid);
	
	public int getTotalPlanCnt(String bizid);
	
	public BizMyPageVo getLogo(String bizid);
	
	public List<BizMyPageVo> getRecentReview(String bizid);
}

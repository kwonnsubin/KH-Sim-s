package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser(int orderNo);
	public BizApplyVo selectApplyDetailPlan(int orderNo);
	public int updateApproveStatus(int orderNo, String bizid);
	public int updateHoldStatus(int orderNo, String bizid);
	
	public List<BizApplyVo> selectBizPlanApplyList(String bizid);
	public Paging getPage(String bizid, int pNum, int parseInt);
	
	//search 목록
	public Search getPage(String bizid, int pNum, int cnt, String searchType, String keyword);
	public int getSearchApplyListCount(String bizid, String searchType, String keyword);
	
	//분류에 따른 목록
	public Search getDevisionPage(String bizid, int pNum, int cnt, String searchType, String keyword,
			int orderStatus);
	public int getDevisionApplyListCount(String bizid, String searchType, String keyword, int orderStatus);
}

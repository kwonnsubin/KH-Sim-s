package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

public interface BizApplyMngtService {
	public BizApplyVo selectApplyDetailUser(int orderNo) throws Exception;
	public BizApplyVo selectApplyDetailPlan(int orderNo) throws Exception;
	public int updateApproveStatus(int orderNo, String bizid) throws Exception;
	public int updateHoldStatus(int orderNo, String bizid) throws Exception;
	
	public List<BizApplyVo> selectBizPlanApplyList(String bizid) throws Exception;
	public Paging getPage(String bizid, int pNum, int parseInt) throws Exception;
	
	//search 목록
	public Search getPage(String bizid, int pNum, int cnt, String searchType, String keyword) throws Exception;
	public int getSearchApplyListCount(String bizid, String searchType, String keyword) throws Exception;
	
	//분류에 따른 목록
	public Search getDevisionPage(String bizid, int pNum, int cnt, String searchType, String keyword,
			int orderStatus) throws Exception;
	public int getDevisionApplyListCount(String bizid, String searchType, String keyword, int orderStatus) throws Exception;
	
	//검색,분류,기간 조회
	public Search getDevisionPageByDateRange(String bizid, int pNum, int cnt, String searchType, String keyword, 
			int orderStatus, String startDate, String endDate) throws Exception;
	
	public int getDevisionApplyListCountByDateRange(String bizid, String searchType, String keyword,
			int orderStatus, String startDate, String endDate) throws Exception;
}

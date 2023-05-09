package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

public interface BizPlanMngtService {

	public List<BizPlanMngtVo> selectBizPlanList(String bizid)throws Exception;

	public BizPlanMngtVo selectBizPlanDetail(int planNo)throws Exception;

	public int registerBizPlan(BizPlanMngtVo vo)throws Exception;

	public BizPlanMngtVo findByBizName(String bizid)throws Exception;

	public int getPlanListCnt(String bizid)throws Exception;

	public Paging getPage(String bizid, int pNum, int cnt)throws Exception;

	public int deleteBizPlan(int planNo)throws Exception;

	public int modifyPlan(BizPlanMngtVo vo)throws Exception;
	
	//search 목록
	public Search getPage(String bizid, int pNum, int cnt, String keyword)throws Exception; 

	public int getSearchPlanListCount(String bizid, String keyword)throws Exception;

}

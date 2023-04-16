package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

public interface BizPlanMngtService {

	public List<BizPlanMngtVo> selectBizPlanList(String bizid);

	public BizPlanMngtVo selectBizPlanDetail(int planNo);

	public int registerBizPlan(BizPlanMngtVo vo);

	public BizPlanMngtVo findByBizName(String bizid);

	public int getPlanListCnt(String bizid);

	public Paging getPage(String bizid, int pNum, int cnt);

	public int deleteBizPlan(int planNo);

	public int modifyPlan(BizPlanMngtVo vo);
	
	//search 목록
	public Search getPage(String bizid, int pNum, int cnt, String keyword); 

	public int getSearchPlanListCount(String bizid, String keyword);

}

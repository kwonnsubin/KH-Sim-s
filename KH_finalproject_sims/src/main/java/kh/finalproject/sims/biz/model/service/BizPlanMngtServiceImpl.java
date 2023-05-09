package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizPlanMngtDao;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

@Service
public class BizPlanMngtServiceImpl implements BizPlanMngtService{
	
	@Autowired
	public BizPlanMngtDao dao;

	@Override
	public List<BizPlanMngtVo> selectBizPlanList(String bizid)throws Exception {
		return dao.selectBizPlanList(bizid);
	}

	@Override
	public BizPlanMngtVo selectBizPlanDetail(int planNo) throws Exception{
		return dao.selectBizPlanDetail(planNo);
	}

	@Override
	public int registerBizPlan(BizPlanMngtVo vo)throws Exception {
		return dao.registerBizPlan(vo);
		
	}

	@Override
	public BizPlanMngtVo findByBizName(String bizid) throws Exception{
		return dao.findByBizName(bizid);
	}

	@Override
	public int getPlanListCnt(String bizid)throws Exception {
		return dao.getPlanListCnt(bizid);
	}

	@Override
	public Paging getPage(String bizid, int pNum, int cnt)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		
		int totalRowCount = dao.getPlanListCnt(bizid);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizPlanMngtVo>data = dao.selectPage(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}

	@Override
	public int deleteBizPlan(int planNo)throws Exception {
		return dao.deleteBizPlan(planNo);
	}

	
	//search
	@Override
	public Search getPage(String bizid, int pNum, int cnt, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		map.put("keyword", keyword);
		
		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("keyword", keyword);
		
		int totalRowCount = dao.getSearchPlanListCount(mapCnt);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizPlanMngtVo>data = dao.searchBizPlanList(map);
		Search search = new Search(data, pNum, pageCount, cnt, 5, keyword);
		
		
		return search;
	}

	@Override
	public int getSearchPlanListCount(String bizid, String keyword)throws Exception {
		Map<String, String> mapCnt = new HashMap<String, String>();
		mapCnt.put("bizid", bizid);
		mapCnt.put("keyword", keyword);
		return dao.getSearchPlanListCount(mapCnt);
	}

	@Override
	public int modifyPlan(BizPlanMngtVo vo)throws Exception {
		return dao.modifyPlan(vo);
	}


}

package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizApplyMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;

@Service
public class BizApplyMngtServiceImpl implements BizApplyMngtService {

	@Autowired
	public BizApplyMngtDao dao;

	@Override
	public BizApplyVo selectApplyDetailUser(int orderNo) {
		return dao.selectApplyDetailUser(orderNo);
	}

	@Override
	public BizApplyVo selectApplyDetailPlan(int orderNo) {
		return dao.selectApplyDetailPlan(orderNo);
	}

	@Override
	public int updateApproveStatus(int orderNo) {
		return dao.updateApproveStatus(orderNo);
	}

	@Override
	public int updateHoldStatus(int orderNo) {
		return dao.updateHoldStatus(orderNo);
	}

	@Override
	public List<BizApplyVo> selectBizPlanApplyList(String bizid) {
		return dao.selectBizPlanApplyList(bizid);
	}

	@Override
	public Paging getPage(String bizid, int pNum, int cnt) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);	
		map.put("bizid",bizid);
		
		int totalRowCount = dao.getApplyListCnt(bizid);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		
		List<BizApplyVo>data = dao.selectPage(map);
		Paging paging = new Paging(data, pNum, pageCount, cnt, 5);
		
		return paging;
	}
}

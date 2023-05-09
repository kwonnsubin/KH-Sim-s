package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizMyPageDao;
import kh.finalproject.sims.biz.model.vo.BizMyPageVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Service
public class BizMyPageServiceImpl implements BizMyPageService{
	
	@Autowired
	private BizMyPageDao dao;

	@Override
	public int getTodayReviewCnt(String bizid)throws Exception {
		return dao.getTodayReviewCnt(bizid);
	}

	@Override
	public int getTotalReviewCnt(String bizid)throws Exception {
		return dao.getTotalReviewCnt(bizid);
	}

	@Override
	public int getTodayApplyCnt(String bizid)throws Exception {
		return dao.getTodayApplyCnt(bizid);
	}

	@Override
	public int getTotalApplyCnt(String bizid)throws Exception {
		return dao.getTotalApplyCnt(bizid);
	}

	@Override
	public int getTotalPlanCnt(String bizid)throws Exception {
		return dao.getTotalPlanCnt(bizid);
	}

	@Override
	public BizMyPageVo getLogo(String bizid)throws Exception {
		return dao.getLogo(bizid);
	}

	@Override
	public List<BizMyPageVo> getRecentReview(String bizid)throws Exception {
		return dao.getRecentReview(bizid);
	}

	@Override
	public List<BizPlanMngtVo> getTopFivePlanInfo(String bizid)throws Exception {
		return dao.getTopFivePlanInfo(bizid);
	}
}

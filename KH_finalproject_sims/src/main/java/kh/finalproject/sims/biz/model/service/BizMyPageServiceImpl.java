package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizMyPageDao;
import kh.finalproject.sims.biz.model.vo.BizMyPageVo;

@Service
public class BizMyPageServiceImpl implements BizMyPageService{
	
	@Autowired
	private BizMyPageDao dao;

	@Override
	public int getTodayReviewCnt(String bizid) {
		return dao.getTodayReviewCnt(bizid);
	}

	@Override
	public int getTotalReviewCnt(String bizid) {
		return dao.getTotalReviewCnt(bizid);
	}

	@Override
	public int getTodayApplyCnt(String bizid) {
		return dao.getTodayApplyCnt(bizid);
	}

	@Override
	public int getTotalApplyCnt(String bizid) {
		return dao.getTotalApplyCnt(bizid);
	}

	@Override
	public int getTotalPlanCnt(String bizid) {
		return dao.getTotalPlanCnt(bizid);
	}

	@Override
	public BizMyPageVo getLogo(String bizid) {
		return dao.getLogo(bizid);
	}
}

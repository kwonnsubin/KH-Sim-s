package kh.finalproject.sims.biz.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizApplyMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;

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
}

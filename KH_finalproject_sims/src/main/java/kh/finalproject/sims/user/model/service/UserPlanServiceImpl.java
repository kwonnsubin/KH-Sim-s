package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserPlanDao;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Service
public class UserPlanServiceImpl implements UserPlanService {
	
	@Autowired
	UserPlanDao dao;

	@Override
	public PlanVo getPlanByNo(int planNo) {
		return dao.getPlanByNo(planNo);
	}

	@Override
	public String getNetNameByNetNo(int netNo) {
		return dao.getNetNameByNetNo(netNo);
	}

	@Override
	public String getGenNameByGenNo(int genNo) {
		return dao.getGenNameByGenNo(genNo);
	}

}

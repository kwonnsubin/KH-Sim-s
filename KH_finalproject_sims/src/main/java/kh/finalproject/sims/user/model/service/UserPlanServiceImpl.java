package kh.finalproject.sims.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserPlanDao;
import kh.finalproject.sims.user.model.vo.LikeVo;
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
	public int insertLike(LikeVo lvo) {
		return dao.insertLike(lvo);
	}

	@Override
	public int deleteLike(int planNo, String userId) {
		return dao.deleteLike(planNo, userId);
	}

	@Override
	public boolean getLikeByPlanWithUser(int planNo, String userId) {
		LikeVo like = dao.getLikeByPlanWithUser(planNo, userId);
		return like != null;
	}


}

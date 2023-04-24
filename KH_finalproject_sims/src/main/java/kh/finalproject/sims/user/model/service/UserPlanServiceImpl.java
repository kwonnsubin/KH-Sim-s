package kh.finalproject.sims.user.model.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.user.model.dao.UserPlanDao;
import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;
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

	// 최근 본 요금제 저장
	@Override
	@Transactional
	public void insertRecentInfo(HashMap<String, Object> recentInfo) {
		if(dao.getRecentInfo(recentInfo) == 1) {
			dao.updateRecentInfo(recentInfo);
		} else {
			dao.insertRecentInfo(recentInfo);
		}
		
	}

	public int selectOrderNo() {
		return dao.selectOrderNo();
	}
	
	public void insertPlanOrder(PlanOrderVo planOrderVO) {
		dao.insertPlanOrder(planOrderVO);
	}
	
	public void insertPayinfoCard(PayCardVo payCardVo) {
		dao.insertPayinfoCard(payCardVo);
	}
	
	public void insertPayinfoAcc(PayAccVo payAccVo) {
		dao.insertPayinfoAcc(payAccVo);
	}

}

package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;

import java.util.HashMap;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanService {

	public PlanVo getPlanByNo(int planNo);
	
	// 최근 본 요금제 저장
	public void insertRecentInfo(HashMap<String, Object> recentInfo);

	public int insertLike(LikeVo lvo);
	
	public int deleteLike(int planNo, String userId);
	
	public boolean getLikeByPlanWithUser(int planNo, String userId);

	public int selectOrderNo();
	
	public void insertPlanOrder(PlanOrderVo planOrderVO);
	
	public void insertPayinfoCard(PayCardVo payCardVo);
	
	public void insertPayinfoAcc(PayAccVo payAccVo);

}

package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanService {

	public PlanVo getPlanByNo(int planNo);

	public int insertLike(LikeVo lvo);
	
	public int deleteLike(int planNo, String userId);
	
	public boolean getLikeByPlanWithUser(int planNo, String userId);

}

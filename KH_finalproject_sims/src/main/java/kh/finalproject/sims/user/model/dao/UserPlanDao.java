package kh.finalproject.sims.user.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Repository
public class UserPlanDao {
	
	@Autowired
	private SqlSession session;
	
	public PlanVo getPlanByNo(int planNo) throws Exception {
		return session.selectOne("plan.getPlanByNo", planNo);
	}

	public int insertLike(LikeVo lvo) throws Exception {
		return session.insert("plan.insertLike", lvo);
	}

	public int deleteLike(int planNo, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNo", planNo);
		map.put("userId", userId);
		return session.delete("plan.deleteLike", map);
	}

	public LikeVo getLikeByPlanWithUser(int planNo, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNo", planNo);
		map.put("userId", userId);
		return session.selectOne("plan.getLikeByPlanWithUser", map);
	}

	// 최근 본 요금제 카운트
	public int getRecentInfo(HashMap<String, Object> recentInfo) throws Exception {
		return session.selectOne("plan.getRecentInfo", recentInfo);
	}

	// 최근 본 요금제 업데이트
	public void updateRecentInfo(HashMap<String, Object> recentInfo) throws Exception {
		session.update("plan.updateRecentInfo", recentInfo);
	}

	// 최근 본 요금제 저장
	public void insertRecentInfo(HashMap<String, Object> recentInfo) throws Exception {
		session.insert("plan.insertRecentInfo", recentInfo);
	}

	public int selectOrderNo() throws Exception {
		return session.selectOne("plan.selectOrderNo");
	}
	
	public void insertPlanOrder(PlanOrderVo planOrderVO) throws Exception {
		session.insert("plan.insertPlanOrder", planOrderVO);
	}
	
	public void insertPayinfoCard(PayCardVo payCardVo) throws Exception {
		session.insert("plan.insertPayinfoCard", payCardVo);
	}
	
	public void insertPayinfoAcc(PayAccVo payAccVo) throws Exception {
		session.insert("plan.insertPayinfoAcc", payAccVo);
	}
}

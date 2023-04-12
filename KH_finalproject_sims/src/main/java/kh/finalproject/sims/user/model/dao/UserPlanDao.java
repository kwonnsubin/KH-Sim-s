package kh.finalproject.sims.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.PlanVo;

@Repository
public class UserPlanDao {
	
	@Autowired
	private SqlSession session;
	
	public PlanVo getPlanByNo(int planNo) {
		return session.selectOne("plan.getPlanByNo", planNo);
	}

	public String getNetNameByNetNo(int netNo) {
		return session.selectOne("plan.getNetNameByNetNo", netNo);
	}

	public String getGenNameByGenNo(int genNo) {
		return session.selectOne("plan.getGenNameByGenNo", genNo);
	}

}

package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Repository
public class UserPlanFindDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PlanVo> selectPlanList() {
		return sqlSession.selectList("plan.selectPlanList");
	}

	public int cntPlanList() {
		return sqlSession.selectOne("plan.cntPlanList");
	}

	public List<BizInfoMngtVo> selectBizNameList() {
		return sqlSession.selectList("plan.bizNameList");
	}

	public List<PlanVo> selectPlanList(PlanVo pvo) {
		return sqlSession.selectList("plan.selectSearchPlanList", pvo);
	}
	
}

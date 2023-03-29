package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Repository
public class BizPlanMngtDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizPlanMngtVo> selectBizPlanList(){
		return sqlSession.selectList("bizPlan.selectPlanList");
	}
	
}

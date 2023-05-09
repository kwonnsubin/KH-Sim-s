package kh.finalproject.sims.biz.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Repository
public class BizPlanMngtDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizPlanMngtVo> selectBizPlanList(String bizid) throws Exception{
		return sqlSession.selectList("bizPlan.selectPlanList", bizid);
	}

	public BizPlanMngtVo selectBizPlanDetail(int planNo) throws Exception{
		return sqlSession.selectOne("bizPlan.selectBizPlanDetail", planNo);
	}

	public int registerBizPlan(BizPlanMngtVo vo) throws Exception{
		return sqlSession.insert("bizPlan.registerBizPlan",vo);
	}

	public BizPlanMngtVo findByBizName(String bizid)throws Exception {
		return sqlSession.selectOne("bizPlan.findByBizName", bizid);
	}

	
	//selectTotalRowCount
	public int getPlanListCnt(String bizid) throws Exception{
		return sqlSession.selectOne("bizPlan.getPlanListCount", bizid);
	}

	public List<BizPlanMngtVo> selectPage(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("bizPlan.selectPage", map);
	}

	public int deleteBizPlan(int planNo)throws Exception {
		return sqlSession.delete("bizPlan.deleteBizPlan", planNo);
	}


	public List<BizPlanMngtVo> searchBizPlanList(Map<String, Object> map)throws Exception {
		return sqlSession.selectList("bizPlan.searchBizPlanList", map);
	}
	
	public int getSearchPlanListCount(Map<String, String> mapCnt) throws Exception{
		return sqlSession.selectOne("bizPlan.getSearchPlanListCount", mapCnt);
	}

	public int modifyPlan(BizPlanMngtVo vo) throws Exception{
		return sqlSession.update("bizPlan.modifyPlan",vo);
	}
	
	
	
}

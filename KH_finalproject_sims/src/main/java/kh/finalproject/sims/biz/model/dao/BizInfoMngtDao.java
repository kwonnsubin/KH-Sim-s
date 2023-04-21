package kh.finalproject.sims.biz.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;


@Repository
public class BizInfoMngtDao {

	@Autowired
	private SqlSession sqlSession;
	
//	public List<BizInfoMngtVo> selectList() throws Exception {
//		return sqlSession.selectList("biz.selectListBizinfo");
//	}

	public BizInfoMngtVo selectBizInfoDetail(String bizid) {
		return sqlSession.selectOne("biz.selectBizInfoDetail", bizid);
	}
	
	//고객센터번호 리스트
	public List<bizInfoMngServiceVo> selectListService(String bizid){
		return sqlSession.selectList("biz.selectListService", bizid);
	}

	//고객센터번호 수정
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList) {
		return sqlSession.update("biz.modifyNetService",netServiceList );
	}

	public int modifyBizInfo(BizInfoMngtVo vo) {
		return sqlSession.update("biz.modifyBizInfo", vo);
	}

	public String getBeforeBizName(String bizid) {
		return sqlSession.selectOne("biz.getBeforeBizName", bizid);
	}

	public int updatePlanTable(Map<String, String> map) {
		return sqlSession.update("biz.updatePlanTable", map);
	}

	public BizInfoMngtVo selectMainBizInfo(String bizId) {
		return sqlSession.selectOne("biz.selectMainBizInfo", bizId);
	}
}

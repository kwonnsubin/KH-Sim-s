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
	

	public BizInfoMngtVo selectBizInfoDetail(String bizid) throws Exception {
		return sqlSession.selectOne("biz.selectBizInfoDetail", bizid);
	}
	
	//고객센터번호 리스트
	public List<bizInfoMngServiceVo> selectListService(String bizid) throws Exception{
		return sqlSession.selectList("biz.selectListService", bizid);
	}

	//고객센터번호 수정
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList) throws Exception {
		return sqlSession.update("biz.modifyNetService",netServiceList );
	}

	public int modifyBizInfo(BizInfoMngtVo vo) throws Exception {
		return sqlSession.update("biz.modifyBizInfo", vo);
	}

	public String getBeforeBizName(String bizid) throws Exception {
		return sqlSession.selectOne("biz.getBeforeBizName", bizid);
	}

	public int updatePlanTable(Map<String, String> map) throws Exception {
		return sqlSession.update("biz.updatePlanTable", map);
	}

	public BizInfoMngtVo selectMainBizInfo(String bizId)  throws Exception{
		return sqlSession.selectOne("biz.selectMainBizInfo", bizId);
	}
	
	//새로가입한 통신사의 serviceList
	public int insertServicList(String bizid) throws Exception{
		return sqlSession.insert("biz.insertServicList", bizid);
	}
}

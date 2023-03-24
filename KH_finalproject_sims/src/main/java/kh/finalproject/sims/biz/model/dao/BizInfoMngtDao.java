package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;


@Repository
public class BizInfoMngtDao {

	@Autowired
	private SqlSession sqlSession;
	
//	public List<BizInfoMngtVo> selectList() throws Exception {
//		return sqlSession.selectList("biz.selectListBizinfo");
//	}

	public BizInfoMngtVo selectBizInfoDetail() {
		return sqlSession.selectOne("biz.selectBizInfoDetail");
	}
	
	//고객센터번호 리스트
	public List<BizInfoMngtVo> selectListService(){
		return sqlSession.selectList("biz.selectListService");
	}
}

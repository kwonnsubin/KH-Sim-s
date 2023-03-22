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
	
	public List<BizInfoMngtVo> selectList() throws Exception {
		return sqlSession.selectList("biz.selectListBizinfo");
	}
}

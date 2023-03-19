package kh.finalproject.sims.biz.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizVo;


@Repository
public class BizDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BizVo> selectList() throws Exception {
		return sqlSession.selectList("biz.selectListBiz");
	}
}

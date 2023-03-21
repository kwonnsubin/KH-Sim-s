package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

@Repository
public class AdminQnaMngtDao {
	
	@Autowired
	SqlSession sqlSession;

	public List<AdminQnaMngtVo> selectQnaList() {
		return sqlSession.selectList("admin.selectQnaList");
	}
	
//	public List<AdminQnaMngtVo> selectFaqDetail() {
//		return sqlSession.selectList(statement, parameter)		
//	}
	
}

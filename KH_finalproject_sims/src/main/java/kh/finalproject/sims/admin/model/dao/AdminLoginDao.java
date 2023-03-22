package kh.finalproject.sims.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminLoginVo;

@Repository
public class AdminLoginDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인
	public AdminLoginVo doLogin(AdminLoginVo vo) {
		return sqlSession.selectOne("admin.login",vo);
	}
	
	
	
}

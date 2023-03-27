package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;

@Repository
public class AdminUserMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//관리자의 사용자 관리 리스트
	public List<AdminUserMngtVo> selectUserList(AdminUserMngtVo vo) {
		return sqlSession.selectList("adminUser.selectUserList", vo);
	}
	
	//관리자의 사용자 관리 상세 페이지 호출
	public AdminUserMngtVo selectUserDetail(String userId) {
		return sqlSession.selectOne("adminUser.selectUserDetail", userId);
	}
	
	
	
	

}

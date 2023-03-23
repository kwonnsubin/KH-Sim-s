package kh.finalproject.sims.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int selectIdCheck(String id) {
		return sqlSession.selectOne("member.selectIdCheck", id);
	}
	
}

package kh.finalproject.sims.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Repository
public class UserMyPageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int changePw(MemberVo memVo) {
		return sqlSession.update("member.changePw", memVo);
	}
	
	public int updateDisable(String id) {
		return sqlSession.update("member.updateDisable", id);
	}

	public UserMemberVo selectMyPageInfo(String id) {
		return sqlSession.selectOne("member.selectMyPageInfo", id);
	}

	public int updateMyPageModify(UserMemberVo userVo) {
		return sqlSession.update("member.updateMyPageModify", userVo);
	}

}

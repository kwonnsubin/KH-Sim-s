package kh.finalproject.sims.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Repository
public class UserMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int selectIdCheck(String id) {
		return sqlSession.selectOne("member.selectIdCheck", id);
	}

	public int signUpMember(MemberVo memVo) {
		return sqlSession.insert("member.signUpMember", memVo);
	}

	public int signUpUser(UserMemberVo userVo) {
		return sqlSession.insert("member.signUpUser", userVo);
	}

	public int signUpBiz(BizInfoMngtVo bizVo) {
		return sqlSession.insert("member.signUpBiz", bizVo);
	}

	public String selectFindId(UserMemberVo userVo) {
		return sqlSession.selectOne("member.selectFindUserId", userVo);
	}

	public String selectFindId(BizInfoMngtVo bizVo) {
		return sqlSession.selectOne("member.selectFindBizId", bizVo);
	}
	
}

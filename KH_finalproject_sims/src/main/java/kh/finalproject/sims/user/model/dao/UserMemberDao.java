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
	
	public int selectIdCheck(String id) throws Exception {
		return sqlSession.selectOne("member.selectIdCheck", id);
	}

	public int signUpMember(MemberVo memVo) throws Exception {
		return sqlSession.insert("member.signUpMember", memVo);
	}

	public int signUpUser(UserMemberVo userVo) throws Exception {
		return sqlSession.insert("member.signUpUser", userVo);
	}

	public int signUpBiz(BizInfoMngtVo bizVo) throws Exception {
		return sqlSession.insert("member.signUpBiz", bizVo);
	}

	public String selectFindId(UserMemberVo userVo) throws Exception {
		return sqlSession.selectOne("member.selectFindUserId", userVo);
	}

	public String selectFindId(BizInfoMngtVo bizVo) throws Exception {
		return sqlSession.selectOne("member.selectFindBizId", bizVo);
	}

	public int selectFindPw(UserMemberVo userVo) throws Exception {
		return sqlSession.selectOne("member.selectFindUserPw", userVo);
	}

	public int selectFindPw(BizInfoMngtVo bizVo) throws Exception {
		return sqlSession.selectOne("member.selectFindBizPw", bizVo);
	}

	public int changePw(MemberVo memVo) throws Exception {
		return sqlSession.update("member.changePw", memVo);
	}

	public int checkEna(String userId) throws Exception {
		return sqlSession.selectOne("member.checkEna", userId);
	}
	
	public int updateEnable(String id) throws Exception {
		return sqlSession.update("member.updateEnable", id);
	}

	public int kakaoInsert(MemberVo memberVo) throws Exception {
		return sqlSession.insert("member.kakaoInsertMember", memberVo);
	}
	
	public void kakaoInsertUserMember(UserMemberVo userMemberVo) throws Exception {
		sqlSession.insert("member.kakaoInsertUserMember", userMemberVo);
	}

	public MemberVo kakaoSelect(String snsId) throws Exception {
		return sqlSession.selectOne("member.kakaoSelect", snsId);
	}

	public String getUserName(String userId) throws Exception {
		return sqlSession.selectOne("member.getUserName", userId);
	}

	public String getBizName(String bizId) throws Exception {
		return sqlSession.selectOne("member.getBizName", bizId);
	}
	
}

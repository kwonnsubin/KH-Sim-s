package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;

@Repository
public class UserFaqDao {
	
	@Autowired
	private SqlSession session;

	
	public List<UserFaqVo> selectFaqList() {
		return session.selectList("faq.selectFaqList");
	};
	
	public List<UserFaqVo> selectFaqDetail(int faqNo) {
		return session.selectList("faq.selectFaqDetail", faqNo);
	}

	public List<UserQnaVo> selectQnaList() {
		return session.selectList("qna.selectQnaList");
	}

	public UserQnaVo selectQnaDetail(int aqNo) {
		return session.selectOne("qna.selectQnaDetail", aqNo);
	}
	
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return session.selectList("ans.selectAnsList", aqNo);
	}

	public void viewCount(int aqNo) {
		session.update("qna.viewCount", aqNo);
	}

	public int insertAnswer(int aqNo, UserAnsVo vo) {
		return session.insert("ans.insertAnswer", vo);
	}

	public int insertQna(UserQnaVo vo) {
		return session.insert("qna.insertQna", vo);
	}
	
	public List<UserQnaVo> selectMyQnaList(String username) {
		return session.selectList("qna.selectMyQnaList", username);
	}

	public List<UserAnsVo> selectMyAnsList(String username) {
		return session.selectList("ans.selectMyAnsList", username);
	}

	public int deleteQna(int aqNo) {
		return session.delete("qna.deleteQna", aqNo);
	}

	public int deleteAns(int aaNo) {
		return session.delete("ans.deleteAns", aaNo);
	}

	public void deAnswers(int aqNo) {
		session.update("qna.deAnswers", aqNo);
	}

	public int updateQna(UserQnaVo vo) {
		return session.update("qna.updateQna", vo);
	}

	public void upAnswers(int aqNo) {
		session.update("qna.upAnswers", aqNo);
	}

	
}

package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

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

	public List<UserQnaVo> searchQnaList(UserQnaVo vo) {
		return session.selectList("qna.searchQnaList", vo);
	}

	public UserQnaVo selectQnaDetail(int aqNo) {
		return session.selectOne("qna.selectQnaDetail", aqNo);
	}
	
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return session.selectList("qna.selectAnsList", aqNo);
	}

	public void viewCount(int aqNo) {
		session.update("qna.viewCount", aqNo);
	}

	public int insertAnswer(int aqNo, UserAnsVo vo) {
		return session.insert("qna.insertAnswer", vo);
	}
	
	public UserAnsVo getAnsByNo(int aaNo) {
		return session.selectOne("qna.getAnsByNo", aaNo);
	}
	
	public int insertReply(int aaNo, UserRplVo vo) {
		return session.insert("qna.insertReply", vo);
	}
	
	public int insertQna(UserQnaVo vo) {
		return session.insert("qna.insertQna", vo);
	}
	
	public List<UserQnaVo> selectMyQnaList(String username) {
		return session.selectList("qna.selectMyQnaList", username);
	}

	public List<UserAnsVo> selectMyAnsList(String username) {
		return session.selectList("qna.selectMyAnsList", username);
	}

	public int deleteQna(int aqNo) {
		return session.delete("qna.deleteQna", aqNo);
	}

	public int deleteAns(int aaNo) {
		return session.delete("qna.deleteAns", aaNo);
	}
	
	public int deleteRpl(int rplNo) {
		return session.delete("qna.deleteRpl", rplNo);
	}

	public void deAnswers(int aqNo) {
		session.update("qna.deAnswers", aqNo);
	}
	
	public void upAnswers(int aqNo) {
		session.update("qna.upAnswers", aqNo);
	}

	public int updateQna(UserQnaVo vo) {
		return session.update("qna.updateQna", vo);
	}

	public int updateAns(UserAnsVo vo) {
		return session.update("qna.updateAns", vo);
	}

	public UserRplVo getRplByNo(int rplNo) {
		return session.selectOne("qna.getRplByNo", rplNo);
	}

	public int updateRpl(UserRplVo vo) {
		return session.update("qna.updateRpl", vo);
	}

}

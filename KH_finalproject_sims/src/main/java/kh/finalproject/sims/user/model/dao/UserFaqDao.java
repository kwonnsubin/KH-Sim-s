package kh.finalproject.sims.user.model.dao;

import java.util.List;
import java.util.Map;

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

	
	public List<UserFaqVo> selectFaqList() throws Exception {
		return session.selectList("faq.selectFaqList");
	};
	
	public UserFaqVo selectFaqDetail(int faqNo) throws Exception {
		return session.selectOne("faq.selectFaqDetail", faqNo);
	}

	public UserQnaVo selectQnaDetail(int aqNo) throws Exception {
		return session.selectOne("qna.selectQnaDetail", aqNo);
	}
	
	public List<UserAnsVo> selectAnsList(int aqNo) throws Exception {
		return session.selectList("qna.selectAnsList", aqNo);
	}

	public void viewCount(int aqNo) throws Exception {
		session.update("qna.viewCount", aqNo);
	}

	public int insertAnswer(int aqNo, UserAnsVo vo) throws Exception {
		return session.insert("qna.insertAnswer", vo);
	}
	
	public UserAnsVo getAnsByNo(int aaNo) throws Exception {
		return session.selectOne("qna.getAnsByNo", aaNo);
	}
	
	public int insertReply(int aaNo, UserRplVo vo) throws Exception {
		return session.insert("qna.insertReply", vo);
	}
	
	public int insertQna(UserQnaVo vo) throws Exception {
		return session.insert("qna.insertQna", vo);
	}
	
	public List<UserQnaVo> selectMyQnaList(String username) throws Exception {
		return session.selectList("qna.selectMyQnaList", username);
	}

	public List<UserAnsVo> selectMyAnsList(String username) throws Exception {
		return session.selectList("qna.selectMyAnsList", username);
	}

	public int deleteQna(int aqNo) throws Exception {
		return session.delete("qna.deleteQna", aqNo);
	}

	public int deleteAns(int aaNo) throws Exception {
		return session.delete("qna.deleteAns", aaNo);
	}
	
	public int deleteRpl(int rplNo) throws Exception {
		return session.delete("qna.deleteRpl", rplNo);
	}

	public int deAnswers(int aqNo) throws Exception {
		return session.update("qna.deAnswers", aqNo);
	}
	public int upAnswers(int aqNo) throws Exception {
		return session.update("qna.upAnswers", aqNo);
	}

	public int updateQna(UserQnaVo vo) throws Exception {
		return session.update("qna.updateQna", vo);
	}

	public int updateAns(UserAnsVo vo) throws Exception {
		return session.update("qna.updateAns", vo);
	}

	public UserRplVo getRplByNo(int rplNo) throws Exception {
		return session.selectOne("qna.getRplByNo", rplNo);
	}

	public int updateRpl(UserRplVo vo) throws Exception {
		return session.update("qna.updateRpl", vo);
	}

	public int getSearchListCount(Map<String, String> mapCnt) throws Exception {
		return session.selectOne("qna.getSearchListCount", mapCnt);
	}

	public List<UserQnaVo> searchList(Map<String, Object> map) throws Exception {
		return session.selectList("qna.searchList", map);
	}
	
	public int deleteQnaByAns(int aqNo) throws Exception {
		return session.delete("qna.deleteQnaByAns", aqNo);
	}

}

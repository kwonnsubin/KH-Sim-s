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

	public List<UserQnaVo> selectQnaDetail(int aqNo) {
		return session.selectList("qna.selectQnaDetail", aqNo);
	}
	
	public List<UserAnsVo> selectAnsList(int aqNo) {
		return session.selectList("ans.selectAnsList", aqNo);
	}

	public void viewCount(int aqNo) {
		session.update("qna.viewCount", aqNo);
	}
	
	

}

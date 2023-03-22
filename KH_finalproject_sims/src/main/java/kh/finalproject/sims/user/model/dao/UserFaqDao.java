package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.UserFaqVo;

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
	
	

}

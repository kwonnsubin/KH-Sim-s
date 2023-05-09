package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

@Repository
public class UserBizDao {

	@Autowired
	private SqlSession session;

	public BizVo getBizByName(String bizName) {
		return session.selectOne("usbiz.getBizByName", bizName);
	}

	public List<String> getNetListByBizId(String bizId) {
		return session.selectList("usbiz.getNetListByBizId", bizId);
	}

	public int getCountReviewByBizId(String bizId) {
		return session.selectOne("usbiz.getCountReviewByBizId", bizId);
	}

	public List<UserReviewVo> getReviewListById(String bizId) {
		return session.selectList("usbiz.getReviewListById", bizId);
	}

	public BizVo getBizById(String bizId) {
		return session.selectOne("usbiz.getBizById", bizId);
	}
	
}

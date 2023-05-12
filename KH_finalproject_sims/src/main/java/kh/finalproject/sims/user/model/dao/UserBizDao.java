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

	public BizVo getBizByName(String bizName) throws Exception {
		return session.selectOne("usbiz.getBizByName", bizName);
	}

	public List<String> getNetListByBizName(String bizName) throws Exception {
		return session.selectList("usbiz.getNetListByBizName", bizName);
	}

	public int getCountReviewByBizId(String bizId) throws Exception {
		return session.selectOne("usbiz.getCountReviewByBizId", bizId);
	}

	public List<UserReviewVo> getReviewListById(String bizName) throws Exception {
		return session.selectList("usbiz.getReviewListById", bizName);
	}

	public BizVo getBizById(String bizId) throws Exception {
		return session.selectOne("usbiz.getBizById", bizId);
	}
	
}

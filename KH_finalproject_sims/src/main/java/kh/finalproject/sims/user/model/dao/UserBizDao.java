package kh.finalproject.sims.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.vo.BizVo;

@Repository
public class UserBizDao {

	@Autowired
	private SqlSession session;

	public BizVo getBizByName(String bizName) {
		return session.selectOne("usbiz.getBizByName", bizName);
	}

	public List<String> getNetByBizId(String bizId) {
		return session.selectList("usbiz.getNetByBizId", bizId);
	}
	
}

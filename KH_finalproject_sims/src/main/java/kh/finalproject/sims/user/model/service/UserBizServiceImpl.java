package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserBizDao;
import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

@Service
public class UserBizServiceImpl implements UserBizService {
	
	@Autowired
	UserBizDao dao;

	@Override
	public BizVo getBizByName(String bizName) throws Exception {
		return dao.getBizByName(bizName);
	}

	@Override
	public List<String> getNetListByBizName(String bizName) throws Exception {
		return dao.getNetListByBizName(bizName);
	}

	@Override
	public int getCountReviewByBizId(String bizId) throws Exception {
		return dao.getCountReviewByBizId(bizId);
	}

	@Override
	public List<UserReviewVo> getReviewListById(String bizId) throws Exception {
		return dao.getReviewListById(bizId);
	}

}

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
	public BizVo getBizByName(String bizName) {
		return dao.getBizByName(bizName);
	}

	@Override
	public List<String> getNetListByBizId(String bizId) {
		return dao.getNetListByBizId(bizId);
	}

	@Override
	public int getCountReviewByBizId(String bizId) {
		return dao.getCountReviewByBizId(bizId);
	}

	@Override
	public List<UserReviewVo> getReviewListById(String bizId) {
		return dao.getReviewListById(bizId);
	}

}

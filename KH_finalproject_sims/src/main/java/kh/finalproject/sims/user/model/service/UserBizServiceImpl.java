package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserBizDao;
import kh.finalproject.sims.user.model.vo.BizVo;

@Service
public class UserBizServiceImpl implements UserBizService {
	
	@Autowired
	UserBizDao dao;

	@Override
	public BizVo getBizByName(String bizName) {
		return dao.getBizByName(bizName);
	}

	@Override
	public List<String> getNetByBizId(String bizId) {
		return dao.getNetByBizId(bizId);
	}

}

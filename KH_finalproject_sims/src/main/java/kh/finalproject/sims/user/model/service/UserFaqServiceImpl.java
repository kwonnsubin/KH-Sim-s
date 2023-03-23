package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.user.model.dao.UserFaqDao;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;

@Service
public class UserFaqServiceImpl implements UserFaqService {
	
	@Autowired
	UserFaqDao dao;

	@Override
	public List<UserFaqVo> selectFaqList() {
		return dao.selectFaqList();
	}

	@Override
	public List<UserFaqVo> selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}

	@Override
	public List<UserQnaVo> selectQnaList() {
		return dao.selectQnaList();
	}

	@Override
	public List<UserQnaVo> selectQnaDetail(int aqNo) {
		return dao.selectQnaDetail(aqNo);
	}

	@Override
	public void viewCount(int aqNo) {
		dao.viewCount(aqNo);
	}

}

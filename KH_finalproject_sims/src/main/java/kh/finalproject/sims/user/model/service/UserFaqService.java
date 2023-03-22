package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.UserFaqVo;

public interface UserFaqService {

	public List<UserFaqVo> selectFaqList();
	
	public List<UserFaqVo> selectFaqDetail(int faqNo);

}

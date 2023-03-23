package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;

public interface UserFaqService {

	public List<UserFaqVo> selectFaqList();
	
	public List<UserFaqVo> selectFaqDetail(int faqNo);

	public List<UserQnaVo> selectQnaList();

	public List<UserQnaVo> selectQnaDetail(int aqNo);

}

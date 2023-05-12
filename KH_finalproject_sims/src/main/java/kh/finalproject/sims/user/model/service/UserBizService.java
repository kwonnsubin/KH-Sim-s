package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

public interface UserBizService {

	BizVo getBizByName(String bizName) throws Exception;

	List<String> getNetListByBizName(String bizName) throws Exception;

	int getCountReviewByBizId(String bizId) throws Exception;

	List<UserReviewVo> getReviewListById(String bizId) throws Exception;

}

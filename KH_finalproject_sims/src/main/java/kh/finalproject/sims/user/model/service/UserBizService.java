package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

public interface UserBizService {

	BizVo getBizByName(String bizName);

	List<String> getNetListByBizId(String bizId);

	int getCountReviewByBizId(String bizId);

	List<UserReviewVo> getReviewListById(String bizId);

}

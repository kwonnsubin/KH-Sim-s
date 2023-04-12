package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.user.model.vo.BizVo;

public interface UserBizService {

	BizVo getBizByName(String bizName);

	List<String> getNetByBizId(String bizId);

}

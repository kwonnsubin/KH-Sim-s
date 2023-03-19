package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizVo;

public interface BizService {
	public List<BizVo> selectList() throws Exception;
}

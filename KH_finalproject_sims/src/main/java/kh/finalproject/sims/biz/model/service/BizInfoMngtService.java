package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;

public interface BizInfoMngtService {
	
	//public List<BizInfoMngtVo> selectList() throws Exception;

	public BizInfoMngtVo selectBizInfoDetail();
	public List<BizInfoMngtVo> selectListService();
}

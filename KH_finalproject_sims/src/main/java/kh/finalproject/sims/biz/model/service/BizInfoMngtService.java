package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;

public interface BizInfoMngtService {
	
	//public List<BizInfoMngtVo> selectList() throws Exception;

	public BizInfoMngtVo selectBizInfoDetail(String bizid);
	public List<bizInfoMngServiceVo> selectListService(String bizid);
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList);
	public int modifyBizInfo(BizInfoMngtVo vo);
}

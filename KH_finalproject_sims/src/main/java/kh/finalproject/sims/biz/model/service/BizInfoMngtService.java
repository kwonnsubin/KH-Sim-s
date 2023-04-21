package kh.finalproject.sims.biz.model.service;

import java.util.List;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;

public interface BizInfoMngtService {
	
	//public List<BizInfoMngtVo> selectList() throws Exception;

	public BizInfoMngtVo selectBizInfoDetail(String bizid);
	public List<bizInfoMngServiceVo> selectListService(String bizid);
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList);
	public int modifyBizInfo(BizInfoMngtVo vo);
	public String getBeforeBizName(String bizid);
	public int updatePlanTable(String beforeBizName, String bizName);
	
	// 메인 통신사 정보
	public BizInfoMngtVo selectMainBizInfo(String bizId);
}

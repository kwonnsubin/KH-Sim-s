package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizInfoMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;
@Service
public class BizInfoMngtServiceImpl implements BizInfoMngtService{
	
	@Autowired
	private BizInfoMngtDao dao;

	/*
	 * @Override public List<BizInfoMngtVo> selectList() throws Exception { return
	 * dao.selectList(); }
	 */

	@Override
	public BizInfoMngtVo selectBizInfoDetail(String bizid) {
		return dao.selectBizInfoDetail(bizid);
	}

	@Override
	public List<bizInfoMngServiceVo> selectListService(String bizid) {
		return dao.selectListService(bizid);
	}

	@Override
	public int modifyNetService(List<bizInfoMngServiceVo> netServiceList) {
		return dao.modifyNetService(netServiceList);
	}

	@Override
	public int modifyBizInfo(BizInfoMngtVo vo) {
		return dao.modifyBizInfo(vo);
	}

	@Override
	public String getBeforeBizName(String bizid) {
		return dao.getBeforeBizName(bizid);
	}

	@Override
	public int updatePlanTable(String beforeBizName, String bizName) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bizName", bizName );
		map.put("beforeBizName", beforeBizName);
		return dao.updatePlanTable(map);
	}

	// 메인 통신사 정보
	@Override
	public BizInfoMngtVo selectMainBizInfo(String bizId) {
		return dao.selectMainBizInfo(bizId);
	}

}

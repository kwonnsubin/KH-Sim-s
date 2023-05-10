package kh.finalproject.sims.biz.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.dao.BizInfoMngtDao;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngServiceVo;
@Service
public class BizInfoMngtServiceImpl implements BizInfoMngtService{
	
	@Autowired
	private BizInfoMngtDao dao;

	/*
	 * @Override public List<BizInfoMngtVo> selectList() throws Exception { return
	 * dao.selectList(); }
	 */

	@Override
	public BizInfoMngtVo selectBizInfoDetail(String bizid)throws Exception {
		return dao.selectBizInfoDetail(bizid);
	}

	@Override
	public List<BizInfoMngServiceVo> selectListService(String bizid)throws Exception {
		return dao.selectListService(bizid);
	}

	@Override
	public int modifyNetService(List<BizInfoMngServiceVo> netServiceList)throws Exception {
		return dao.modifyNetService(netServiceList);
	}

	@Override
	public int modifyBizInfo(BizInfoMngtVo vo) throws Exception{
		return dao.modifyBizInfo(vo);
	}

	@Override
	public String getBeforeBizName(String bizid)throws Exception {
		return dao.getBeforeBizName(bizid);
	}

	@Override
	public int updatePlanTable(String beforeBizName, String bizName) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("bizName", bizName );
		map.put("beforeBizName", beforeBizName);
		return dao.updatePlanTable(map);
	}

	// 메인 통신사 정보
	@Override
	public BizInfoMngtVo selectMainBizInfo(String bizId)throws Exception {
		return dao.selectMainBizInfo(bizId);
	}

	@Override
	public int insertServicList(String bizid)throws Exception {
		return dao.insertServicList(bizid);
	}

}

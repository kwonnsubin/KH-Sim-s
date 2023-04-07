package kh.finalproject.sims.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.dao.UserPlanFindDao;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Service
public class UserPlanFindServiceImpl implements UserPlanFindService {
	
	@Autowired
	private UserPlanFindDao dao;
	
	// 요금제 리스트
	@Override
	public List<PlanVo> selectPlanList() {
		return dao.selectPlanList();
	}
	
	// 검색 요금제 리스트
	@Override
	public List<PlanVo> selectPlanList(PlanVo pvo) {
		return dao.selectPlanList(pvo);
	}

	// 요금제 총 갯수
	@Override
	public int cntPlanList() {
		return dao.cntPlanList();
	}

	@Override
	public List<BizInfoMngtVo> selectBizNameList() {
		return dao.selectBizNameList();
	}

}

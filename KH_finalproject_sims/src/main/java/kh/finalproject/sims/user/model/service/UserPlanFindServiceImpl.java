package kh.finalproject.sims.user.model.service;

import java.util.List;
import java.util.Map;

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
	public List<PlanVo> selectPlanList(String searchText) {
		return dao.selectPlanList(searchText);
	}
	
	// 검색 요금제 리스트
	@Override
	public List<PlanVo> selectPlanList(Map searchMap) {
		return dao.selectPlanList(searchMap);
	}

	// 요금제 총 갯수
	@Override
	public int cntPlanList(String searchText) {
		return dao.cntPlanList(searchText);
	}
	
	// 검색된 요금제 갯수
	@Override
	public int cntPlanList(Map searchMap) {
		return dao.cntPlanList(searchMap);
	}

	// 통신사 리스트
	@Override
	public List<BizInfoMngtVo> selectBizNameList() {
		return dao.selectBizNameList();
	}

}

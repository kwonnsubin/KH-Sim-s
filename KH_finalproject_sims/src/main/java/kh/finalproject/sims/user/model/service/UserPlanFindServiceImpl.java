package kh.finalproject.sims.user.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.dao.UserPlanFindDao;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Service
public class UserPlanFindServiceImpl implements UserPlanFindService {
	
	@Autowired
	private UserPlanFindDao dao;
	
	// 요금제 리스트
	@Override
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap) {
		return dao.selectPlanList(searchMap);
	}
	
	// 검색 요금제 리스트
	@Override
	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap) {
		return dao.selectPlanFilterList(searchMap);
	}

	// 요금제 총 갯수
	@Override
	public int cntPlanList(Map<String, Object> searchMap) {
		return dao.cntPlanList(searchMap);
	}
	
	// 검색된 요금제 갯수
	@Override
	public int cntPlanFilterList(Map<String, Object> searchMap) {
		return dao.cntPlanFilterList(searchMap);
	}

	// 통신사 리스트
	@Override
	public List<String> selectBizNameList() {
		return dao.selectBizNameList();
	}

	// 질문 답 리스트
	@Override
	public CustomQueVo selectCustomQueList(String userId) {
		return dao.selectCustomQueList(userId);
	}

	// 질문 답 넣기
	@Override
	public int insertQueVal(Map<String, Object> val) {
		return dao.insertQueVal(val);
	}

	// 접근한 유저 데이터가 있는지 없는지 확인
	@Override
	public int selectUser(String userId) {
		return dao.selectUser(userId);
	}

	@Override
	public void insertUser(String userId) {
		dao.insertUser(userId);
	}

	// 조회수 랭킹
	@Override
	public List<PlanVo> selectViewRankList() {
		return dao.selectViewRankList();
	}

	// 찜 랭킹
	@Override
	public List<PlanVo> selectLikeRankList() {
		return dao.selectLikeRankList();
	}

	// 가입자 수 랭킹
	@Override
	public List<PlanVo> selectOrderRankList() {
		return dao.selectOrderRankList();
	}

	// 통신사 별 요금제
	@Override
	public List<PlanVo> selectBizPlanList(String bizId) {
		return dao.selectBizPlanList(bizId);
	}

	// 통신사 id
	@Override
	public List<BizInfoMngtVo> selectBizIdList() {
		return dao.selectBizIdList();
	}

}

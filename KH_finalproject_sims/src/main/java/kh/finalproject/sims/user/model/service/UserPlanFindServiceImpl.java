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
	public List<PlanVo> selectPlanList(Map<String, Object> searchMap) throws Exception {
		return dao.selectPlanList(searchMap);
	}
	
	// 검색 요금제 리스트
	@Override
	public List<PlanVo> selectPlanFilterList(Map<String, Object> searchMap) throws Exception {
		return dao.selectPlanFilterList(searchMap);
	}

	// 요금제 총 갯수
	@Override
	public int cntPlanList(Map<String, Object> searchMap) throws Exception {
		return dao.cntPlanList(searchMap);
	}
	
	// 검색된 요금제 갯수
	@Override
	public int cntPlanFilterList(Map<String, Object> searchMap) throws Exception {
		return dao.cntPlanFilterList(searchMap);
	}

	// 통신사 리스트
	@Override
	public List<String> selectBizNameList() throws Exception {
		return dao.selectBizNameList();
	}

	// 질문 답 리스트
	@Override
	public CustomQueVo selectCustomQueList(String userId) throws Exception {
		return dao.selectCustomQueList(userId);
	}

	// 질문 답 넣기
	@Override
	public int insertQueVal(Map<String, Object> val) throws Exception {
		return dao.insertQueVal(val);
	}

	// 접근한 유저 데이터가 있는지 없는지 확인
	@Override
	public int selectUser(String userId) throws Exception {
		return dao.selectUser(userId);
	}

	@Override
	public void insertUser(String userId) throws Exception {
		dao.insertUser(userId);
	}

	// 조회수 랭킹
	@Override
	public List<PlanVo> selectViewRankList() throws Exception {
		return dao.selectViewRankList();
	}

	// 찜 랭킹
	@Override
	public List<PlanVo> selectLikeRankList() throws Exception {
		return dao.selectLikeRankList();
	}

	// 가입자 수 랭킹
	@Override
	public List<PlanVo> selectOrderRankList() throws Exception {
		return dao.selectOrderRankList();
	}

	// 통신사 별 요금제
	@Override
	public List<PlanVo> selectBizPlanList(String bizId) throws Exception {
		return dao.selectBizPlanList(bizId);
	}

	// 통신사 id
	@Override
	public List<BizInfoMngtVo> selectBizIdList() throws Exception {
		return dao.selectBizIdList();
	}

}

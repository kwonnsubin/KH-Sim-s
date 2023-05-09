package kh.finalproject.sims.user.model.service;

import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;

import java.util.HashMap;
import kh.finalproject.sims.user.model.vo.PlanVo;

public interface UserPlanService {

	// 요금제 조회
	public PlanVo getPlanByNo(int planNo) throws Exception;
	
	// 최근 본 요금제 저장
	public void insertRecentInfo(HashMap<String, Object> recentInfo) throws Exception;

	// 찜하기
	public int insertLike(LikeVo lvo) throws Exception;
	
	// 찜취소
	public int deleteLike(int planNo, String userId) throws Exception;
	
	// 찜조회
	public boolean getLikeByPlanWithUser(int planNo, String userId) throws Exception;

	// 신청서번호 생성
	public int selectOrderNo() throws Exception;
	
	// 신청서 저장
	public void insertPlanOrder(PlanOrderVo planOrderVO) throws Exception;
	
	// 카드정보 저장
	public void insertPayinfoCard(PayCardVo payCardVo) throws Exception;
	
	// 계좌정보 저장
	public void insertPayinfoAcc(PayAccVo payAccVo) throws Exception;

}

package kh.finalproject.sims.user.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.dao.UserMyPageDao;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Service
public class UserMyPageServiceImpl implements UserMyPageService {

	@Autowired
	private UserMyPageDao dao;
		
	// 계정 탈퇴
	@Override
	public int updateDisable(String id) throws Exception {
		return dao.updateDisable(id);
	}

	// 유저 정보 가져오기
	@Override
	public UserMemberVo selectMyPageInfo(String id) throws Exception {
		return dao.selectMyPageInfo(id);
	}

	// 유저 정보 수정
	@Override
	@Transactional
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo) throws Exception {
		if(memVo.getPw() != null) {
			dao.changePw(memVo);
		}
		dao.updateMyPageModify(userVo);
	}

	// 공지사항 리스트
	@Override
	public List<AdminNoticeMngtVo> selectNoticeList() throws Exception {
		return dao.selectNoticeList();
	}

	// 공지사항 내용
	@Override
	public AdminNoticeMngtVo selectNoticeDetail(int number) throws Exception {
		return dao.selectNoticeDetail(number);
	}

	// 리뷰 작성할 가입한 요금제 리스트
	@Override
	public List<BizApplyVo> selectOrderList(String userId) throws Exception {
		return dao.selectOrderList(userId);
	}

	// 작성한 리뷰 리스트
	@Override
	public List<BizReviewMngtVo> selectReviewList(String userId) throws Exception {
		return dao.selectReviewList(userId);
	}

	// 리뷰 작성
	@Override
	@Transactional
	public int insertReview(BizReviewMngtVo brVo) throws Exception {
		int result = 0;
		int num = dao.insertReview(brVo);
		
		if(num == 1) {
			result = dao.updateBizReviewAvg(brVo.getBizId());
		}
		return result;
	}

	// 리뷰 수정
	@Override
	public int updateReview(BizReviewMngtVo brVo) throws Exception {
		int result = 0;
		int num = dao.updateReview(brVo);
		
		if(num == 1) {
			result = dao.updateBizReviewAvg(brVo.getBizId());
		}
		return result;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(BizReviewMngtVo brVo) throws Exception {
		int result = 0;
		int num = dao.deleteReview(brVo);
		
		if(num == 1) {
			result = dao.updateBizReviewAvg(brVo.getBizId());
		}
		return result;
	}

	// 리뷰에 나올 가입한 요금제 리스트 갯수
	@Override
	public int selectOrderListCount(String userId) throws Exception {
		return dao.selectOrderListCount(userId);
	}

	// 가입한 요금제 리스트 (신청완료)
	@Override
	public List<BizApplyVo> selectMyPlanListOrder(String userId) throws Exception {
		return dao.selectMyPlanListOrder(userId);
	}
	
	// 가입한 요금제 리스트 (승인완료)
	@Override
	public List<BizApplyVo> selectMyPlanListAccept(String userId) throws Exception {
		return dao.selectMyPlanListAccept(userId);
	}
	
	// 가입한 요금제 리스트 (승인보류)
	@Override
	public List<BizApplyVo> selectMyPlanListHold(String userId) throws Exception {
		return dao.selectMyPlanListHold(userId);
	}

	// 가입한 요금제 상세
	@Override
	public BizApplyVo selectMyPlanDetail(HashMap<String, Object> searchOrder) throws Exception {
		return dao.selectMyPlanDetail(searchOrder);
	}

	// 가입한 요금제 리스트 갯수
	@Override
	public int selectMyPlanListCount(String userId) throws Exception {
		return dao.selectMyPlanListCount(userId);
	}

	// 최근 본 요금제
	@Override
	public List<PlanVo> selectRecentList(String userId) throws Exception {
		return dao.selectRecentList(userId);
	}

	// 최근 본 요금제 갯수
	@Override
	public int selectRecentListCount(String userId) throws Exception {
		return dao.selectRecentListCount(userId);
	}
	
	// 찜한 요금제
	public List<PlanVo> selectLikeList(String userId) throws Exception {
		return dao.selectLikeList(userId);
	}
	
	// 찜한 요금제 갯수
	public int selectLikeListCount(String userId) throws Exception {
		return dao.selectLikeListCount(userId);
	}

	// 내 정보 비밀번호 확인
	@Override
	public String infoPasswordCheck(String userId) throws Exception {
		return dao.infoPasswordCheck(userId);
	}
	
}

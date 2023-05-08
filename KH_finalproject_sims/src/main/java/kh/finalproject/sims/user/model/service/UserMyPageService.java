package kh.finalproject.sims.user.model.service;

import java.util.HashMap;
import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMyPageService {

	// 계정 탈퇴
	public int updateDisable(String id) throws Exception;
	
	// 마이페이지
	public UserMemberVo selectMyPageInfo(String id);

	// 유저 정보 수정
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo) throws Exception;

	// 공지사항 리스트
	public List<AdminNoticeMngtVo> selectNoticeList() throws Exception;

	// 공지사항 내용
	public AdminNoticeMngtVo selectNoticeDetail(int number) throws Exception;

	// 리뷰에 나올 가입한 요금제 리스트
	public List<BizApplyVo> selectOrderList(String userId) throws Exception;

	// 작성한 리뷰 리스트
	public List<BizReviewMngtVo> selectReviewList(String userId) throws Exception;

	// 리뷰 작성
	public int insertReview(BizReviewMngtVo brVo) throws Exception;

	// 리뷰 수정
	public int updateReview(BizReviewMngtVo brVo) throws Exception;

	// 리뷰 삭제
	public int deleteReview(BizReviewMngtVo brVo) throws Exception;

	// 리뷰에 나올 가입한 요금제 리스트 갯수
	public int selectOrderListCount(String userId) throws Exception;

	// 가입한 요금제 리스트
	public List<BizApplyVo> selectMyPlanList(String userId) throws Exception;

	// 가입한 요금제 상세
	public BizApplyVo selectMyPlanDetail(HashMap<String, Object> searchOrder) throws Exception;

	// 가입한 요금제 리스트 갯수
	public int selectMyPlanListCount(String userId) throws Exception;

	// 최근 본 요금제
	public List<PlanVo> selectRecentList(String userId) throws Exception;

	// 최근 본 요금제 갯수
	public int selectRecentListCount(String userId) throws Exception;

	// 찜한 요금제
	public List<PlanVo> selectLikeList(String userId) throws Exception;

	// 찜한 요금제 갯수
	public int selectLikeListCount(String userId) throws Exception;

	// 내 정보 비밀번호 확인
	public String infoPasswordCheck(String userId) throws Exception;
	
	
}

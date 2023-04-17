package kh.finalproject.sims.user.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

public interface UserMyPageService {

	// 계정 탈퇴
	public int updateDisable(String id);
	
	// 마이페이지
	public UserMemberVo selectMyPageInfo(String id);

	// 유저 정보 수정
	public void updateMyPageModify(MemberVo memVo, UserMemberVo userVo);

	// 공지사항 리스트
	public List<AdminNoticeMngtVo> selectNoticeList();

	// 공지사항 내용
	public AdminNoticeMngtVo selectNoticeDetail(int number);

	// 리뷰에 나올 가입한 요금제 리스트
	public List<BizApplyVo> selectOrderList(String userId);

	// 작성한 리뷰 리스트
	public List<BizReviewMngtVo> selectReviewList(String userId);

	// 리뷰 작성
	public int insertReview(BizReviewMngtVo brVo);

	// 리뷰 수정
	public int updateReview(BizReviewMngtVo brVo);

	// 리뷰 삭제
	public int deleteReview(BizReviewMngtVo brVo);

	// 리뷰에 나올 가입한 요금제 리스트 갯수
	public int selectOrderListCount(String userId);

	// 가입한 요금제 리스트
	public List<BizApplyVo> selectMyPlanList(String userId);
	
}

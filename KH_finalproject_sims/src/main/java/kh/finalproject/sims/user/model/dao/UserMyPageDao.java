package kh.finalproject.sims.user.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Repository
public class UserMyPageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int changePw(MemberVo memVo) {
		return sqlSession.update("member.changePw", memVo);
	}
	
	public int updateDisable(String id) {
		return sqlSession.update("member.updateDisable", id);
	}

	public UserMemberVo selectMyPageInfo(String id) {
		return sqlSession.selectOne("member.selectMyPageInfo", id);
	}

	public int updateMyPageModify(UserMemberVo userVo) {
		return sqlSession.update("member.updateMyPageModify", userVo);
	}

	public List<AdminNoticeMngtVo> selectNoticeList() {
		return sqlSession.selectList("adminNotice.selectMypageNoticeList");
	}

	public AdminNoticeMngtVo selectNoticeDetail(int number) {
		return sqlSession.selectOne("adminNotice.selectMypageNoticeDetail", number);
	}

	public List<BizApplyVo> selectOrderList(String userId) {
		return sqlSession.selectList("apply.selectOrderList", userId);
	}
	
	public int selectOrderListCount(String userId) {
		return sqlSession.selectOne("apply.selectOrderListCount", userId);
	}

	public List<BizReviewMngtVo> selectReviewList(String userId) {
		return sqlSession.selectList("bizReview.selectReviewList", userId);
	}

	public int insertReview(BizReviewMngtVo brVo) {
		return sqlSession.insert("bizReview.insertReview", brVo);
	}

	public int updateReview(BizReviewMngtVo brVo) {
		return sqlSession.update("bizReview.updateReview", brVo);
	}

	public int deleteReview(BizReviewMngtVo brVo) {
		return sqlSession.delete("bizReview.deleteReview", brVo);
	}

	public List<BizApplyVo> selectMyPlanList(String userId) {
		return sqlSession.selectList("apply.selectMyPlanList", userId);
	}

	public BizApplyVo selectMyPlanDetail(HashMap<String, Object> searchOrder) {
		return sqlSession.selectOne("apply.selectMyPlanDetail", searchOrder);
	}

}

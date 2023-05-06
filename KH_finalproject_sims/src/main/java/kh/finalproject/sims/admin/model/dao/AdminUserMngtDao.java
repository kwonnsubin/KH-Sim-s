package kh.finalproject.sims.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;

@Repository
public class AdminUserMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//관리자의 사용자 관리 리스트
	public List<AdminUserMngtVo> selectUserList(Map<String, Object> map) {
		return sqlSession.selectList("adminUser.selectUserList", map);
	}

	//관리자의 사용자 관리 리스트 전체 개수
	public int selectUserListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("adminUser.selectUserListCnt", map);
	}
	
	//관리자의 사용자 관리 상세 페이지 호출
	public AdminUserMngtVo selectUserDetail(String userId) {
		return sqlSession.selectOne("adminUser.selectUserDetail", userId);
	}

	//관리자의 사용자 관리 수정 저장
	public int saveUserModify(AdminUserMngtVo vo) {
		return sqlSession.update("adminUser.saveUserModify", vo);
	}

	//가입한 요금제 개수
	public int selectMyPlanListCountAdmin(String userId) {
		return sqlSession.selectOne("adminUser.selectMyPlanListCountAdmin", userId);
	}
	
	//리뷰를 단 요금제 개수
	public int selectOrderListCountAdmin(String userId) {
		return sqlSession.selectOne("adminUser.selectOrderListCountAdmin", userId);
	}

	//사용자가 신청한 요금제 리스트 ajax
	public List<AdminUserMngtVo> selectUserApplyPlanAjax(String userId) {
		return sqlSession.selectList("adminUser.selectUserApplyPlanAjax", userId);
	}

	//사용자가 단 리뷰 리스트 ajax
	public List<AdminUserMngtVo> selectUserReviewAjax(String userId) {
		return sqlSession.selectList("adminUser.selectUserReviewAjax", userId);
	}
	
 

}

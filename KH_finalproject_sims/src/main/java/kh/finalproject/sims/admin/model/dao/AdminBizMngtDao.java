package kh.finalproject.sims.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@Repository
public class AdminBizMngtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//통신사 관리 리스트 
	public List<AdminBizMngtVo> selectApplyList(AdminBizMngtVo vo) {
		return sqlSession.selectList("adminBiz.selectApplyList", vo);
	}

	//통신사 관리 신청정보 상세 페이지 호출
	public AdminBizMngtVo selectApplyDetail(String bizId) {
		return sqlSession.selectOne("adminBiz.selectApplyDetail", bizId);
	}

	//통신사 관리 통신사 정보 상세 페이지로 이동
	public AdminBizMngtVo selectBizDetail(String bizOwnerName) {
		return sqlSession.selectOne("adminBiz.selectBizDetail",bizOwnerName);
	}
	
	//통신사 상세 수정 페이지로 이동
	public AdminNoticeMngtVo selectBizModify(String bizId) {
		return sqlSession.selectOne("adminBiz.selectBizModify", bizId);
	}

	//통신사의 탈퇴 신청 리스트로 이동
	public List<AdminBizMngtVo> selectWithdrawalList(AdminBizMngtVo vo) {
		return sqlSession.selectList("adminBiz.selectWithdrawalList",vo);
	}
	
	//통신사의 탈퇴 신청 상세 페이지로 이동
	public AdminBizMngtVo selectWithdrawalDetail(String bizId) {
		return sqlSession.selectOne("adminBiz.selectWithdrawalDetail", bizId);
	}
	
	//통신사 요금제 개통 신청 리스트
	public List<AdminBizMngtVo> selectBizPlanApplyList(AdminBizMngtVo vo) {
		return sqlSession.selectList("adminBiz.selectBizPlanApplyList", vo);
	}

	//통신사 요금제 게통 상세 페이지로 이동
	public AdminBizMngtVo selectBizPlanApplyDetail(int orderNo) {
		return sqlSession.selectOne("adminBiz.selectBizPlanApplyDetail", orderNo);
	}


}

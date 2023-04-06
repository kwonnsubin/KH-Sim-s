package kh.finalproject.sims.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminBizMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@Service
public class AdminBizMngtServiceImpl implements AdminBizMngtService{
	
	@Autowired
	private AdminBizMngtDao dao;

	//통신사 정보 리스트
	@Override
	public List<AdminBizMngtVo> selectApplyList(AdminBizMngtVo vo) {
		return dao.selectApplyList(vo);
	}

	//통신사의 신청정보 상세
	@Override
	public AdminBizMngtVo selectApplyDetail(String bizId) {
		return dao.selectApplyDetail(bizId);
	}
	
	//통신사의 요금제 정보 리스트
	@Override
	public List<AdminBizMngtVo> selectBizPlanList(String bizId) {
		return dao.selectBizPlanList(bizId);
	}
	
	//통신사 검토결과 수정
	@Override
	public int updateBizStatus(AdminBizMngtVo vo) {
		return dao.updateBizStatus(vo);
	}
	
	//통신사 상세 수정 저장
	@Override
	public int saveBizModify(AdminBizMngtVo vo) {
		return dao.saveBizModify(vo);
	}


	//통신사 탈퇴 신청 리스트
	@Override
	public List<AdminBizMngtVo> selectWithdrawalList(AdminBizMngtVo vo) {
		return dao.selectWithdrawalList(vo);
	}
	
	//통신사의 탈퇴 신청 상세 페이지로 이동
	@Override
	public AdminBizMngtVo selectWithdrawalDetail(String bizId) {
		return dao.selectWithdrawalDetail(bizId);
	}
	
	//통신사 요금제 개통 신청 리스트
	@Override
	public List<AdminBizMngtVo> selectBizPlanApplyList(AdminBizMngtVo vo) {
		return dao.selectBizPlanApplyList(vo);
	}

	//통신사 요금제 개통 상세 페이지로 이동
	@Override
	public AdminBizMngtVo selectBizPlanApplyDetail(int orderNo) {
		return dao.selectBizPlanApplyDetail(orderNo);
	}

	
	


}

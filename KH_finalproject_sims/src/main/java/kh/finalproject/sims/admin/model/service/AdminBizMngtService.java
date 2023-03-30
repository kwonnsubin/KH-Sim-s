package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;


public interface AdminBizMngtService {

	//통신사 신청정보 리스트
	public List<AdminBizMngtVo> selectApplyList(AdminBizMngtVo vo);

	//통신사의 신청정보 상세 페이지로 이동
	public AdminBizMngtVo selectApplyDetail(String bizId);

	//통신사의 상세 정보 페이지로 이동
	public AdminBizMngtVo selectBizDetail(String bizOwnerName);
	
	//통신사 요금제 개통 신청 리스트
	public List<AdminBizMngtVo> selectBizPlanApplyList(AdminBizMngtVo vo);

}

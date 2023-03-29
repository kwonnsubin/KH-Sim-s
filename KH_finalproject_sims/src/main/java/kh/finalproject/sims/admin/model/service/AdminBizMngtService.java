package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;


public interface AdminBizMngtService {

	//통신사 신청정보 리스트
	public List<AdminBizMngtVo> selectBizApplyList(AdminBizMngtVo vo);

}

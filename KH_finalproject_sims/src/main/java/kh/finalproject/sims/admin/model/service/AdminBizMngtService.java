package kh.finalproject.sims.admin.model.service;

import java.util.List;

import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.common.page.Search;


public interface AdminBizMngtService {

	//통신사 신청정보 리스트
	public Search selectApplyList(int pNum, int cnt, String searchOption, String searchRadioVal, String searchBox) throws Exception;

	//통신사의 신청정보 상세 페이지로 이동
	public AdminBizMngtVo selectApplyDetail(String bizId) throws Exception;
	
	//통신사의 요금제 리스트
	public Search selectBizPlanList(int pNum, int cnt, String searchOption, String searchRadioVal, String searchBox) throws Exception;
	
	//통신사 수정 저장
 	public int saveBizModify(AdminBizMngtVo vo) throws Exception;
	
	//통신사의 탈퇴 정보 리스트
	public List<AdminBizMngtVo> selectWithdrawalList(AdminBizMngtVo vo) throws Exception;
	
	//통신사의 탈퇴 정보 상세 페이지로 이동
	public AdminBizMngtVo selectWithdrawalDetail(String bizId) throws Exception;
	
	//통신사 요금제 개통 신청 리스트
	public Search selectBizPlanApplyList(int pNum, int cnt, String searchOption, String searchRadioVal, String searchBox) throws Exception;

	//통신사 요금제 개통 신청 상세 페이지로 이동
	public AdminBizMngtVo selectBizPlanApplyDetail(int orderNo) throws Exception;

	//통신사 검토결과 변경
	public int updateBizStatus(AdminBizMngtVo vo) throws Exception;
	
	//통신사 탈퇴 확정
	public int updateWithdrawalBizStatus(AdminBizMngtVo vo) throws Exception;

	//통신사 요금제 정보 ajax
	public AdminBizMngtVo selectPlanAjax(int planNo) throws Exception;

	

}

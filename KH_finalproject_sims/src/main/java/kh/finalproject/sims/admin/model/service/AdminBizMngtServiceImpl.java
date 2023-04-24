package kh.finalproject.sims.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.finalproject.sims.admin.model.dao.AdminBizMngtDao;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.common.page.Search;

@Service
public class AdminBizMngtServiceImpl implements AdminBizMngtService{
	
	@Autowired
	private AdminBizMngtDao dao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	//통신사 정보 리스트
	@Override
	public Search selectApplyList(int pNum, int cnt, String searchOption, String searchRadioVal, String searchBox) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("searchOption", searchOption);
		map.put("searchRadioVal", searchRadioVal);
		map.put("searchBox", searchBox);
		List<AdminBizMngtVo> dataList = dao.selectApplyList(map);
		int totalRowCount = dao.selectApplyListCnt(map);
		int mod = totalRowCount % cnt == 0 ? 0 : 1;
		int pageCount = (totalRowCount / cnt) + mod;
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, totalRowCount, searchOption, searchRadioVal, searchBox);
		return search;
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
	
	//통신사 탈퇴 확정
	@Override
	public int updateWithdrawalBizStatus(AdminBizMngtVo vo) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		// 탈퇴 메일 발송
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			String setFrom = "sooseong1989@gmail.com";
			String toMail = vo.getBizEmail();
			String title = "[Sims] 탈퇴 확정 안내";
			String content = "Sims 탈퇴 확정 안내 메일입니다.<br/>";
				content += "귀사는 아래와 같은 사유로 탈퇴가 확정 되었습니다. <br/><br/>";
				content += vo.getOpinion();
				content += "<br/><br/>";
				content += "특이사항이 있을경우 발송 메일 주소로 연락 바랍니다.<br/>";
				content += "감사합니다.";
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return dao.updateWithdrawalBizStatus(vo);
	}
	
	//통신사 요금제 개통 신청 리스트
	@Override
	public Search selectBizPlanApplyList(int pNum, int cnt, String searchOption, String searchRadioVal, String searchBox) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",  (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		map.put("searchOption", searchOption);
		map.put("searchRadioVal", searchRadioVal);
		map.put("searchBox", searchBox);
		List<AdminBizMngtVo> dataList = dao.selectBizPlanApplyList(map);
		int totalRowCount =dao.selectBizPlanApplyListCnt(map);
		int mod = totalRowCount % cnt == 0? 0 : 1;
		int pageCount = (totalRowCount /cnt) + mod;
		Search search = new Search(dataList, pNum, pageCount, cnt, 5, totalRowCount, searchOption, searchRadioVal, searchBox);
		return search;
	}

	//통신사 요금제 개통 상세 페이지로 이동
	@Override
	public AdminBizMngtVo selectBizPlanApplyDetail(int orderNo ) {
		return dao.selectBizPlanApplyDetail(orderNo);
	}
	
	//통신사 요금제 정보 ajax
	@Override
	public AdminBizMngtVo selectPlanAjax(int planNo) {
		return dao.selectPlanAjax(planNo);
	}
	
	


}

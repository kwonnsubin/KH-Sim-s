package kh.finalproject.sims.user.model.service;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproject.sims.user.model.dao.UserBizDao;
import kh.finalproject.sims.user.model.dao.UserMyPageDao;
import kh.finalproject.sims.user.model.dao.UserPlanDao;
import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Service
public class UserPlanServiceImpl implements UserPlanService {
	
	@Autowired
	private UserPlanDao dao;
	
	@Autowired 
	private UserBizDao bizDao;
	
	@Autowired
	private UserMyPageDao mypageDao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 요금제 번호로 조회
	@Override
	public PlanVo getPlanByNo(int planNo) throws Exception {
		return dao.getPlanByNo(planNo);
	}

	// 찜추가
	@Override
	public int insertLike(LikeVo lvo) throws Exception {
		return dao.insertLike(lvo);
	}

	// 찜삭제
	@Override
	public int deleteLike(int planNo, String userId) throws Exception {
		return dao.deleteLike(planNo, userId);
	}

	// 찜 조회
	@Override
	public boolean getLikeByPlanWithUser(int planNo, String userId) throws Exception {
		LikeVo like = dao.getLikeByPlanWithUser(planNo, userId);
		return like != null;
	}

	// 최근 본 요금제 저장
	@Override
	@Transactional
	public void insertRecentInfo(HashMap<String, Object> recentInfo) throws Exception {
		if(dao.getRecentInfo(recentInfo) == 1) {
			dao.updateRecentInfo(recentInfo);
		} else {
			dao.insertRecentInfo(recentInfo);
		}
		
	}

	// 가입신청서 번호
	@Override
	public int selectOrderNo() throws Exception {
		return dao.selectOrderNo();
	}
	
	// 가입신청서 저장
	@Override
	@Transactional
	public void insertPlanOrder(PlanOrderVo planOrderVO) throws Exception {
		
		// 가입 확인 메일 보내기
		UserMemberVo user = mypageDao.selectMyPageInfo(planOrderVO.getUserId());
		MimeMessage msg = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "utf-8");
			String from = "sooseong1989@gmail.com";
			String toMail = user.getUserEmail();
			String title = "[Sims] 요금제 가입신청이 접수되었습니다.";
			String content = user.getUserName() + " 고객님 가입신청해 주셔서 감사합니다.<br/>";
			content += "<br/>요금제 정보"
					+ "<br/>요금제명 : " + dao.getPlanByNo(planOrderVO.getPlanNo()).getPlanName()
					+ "<br/>통신사 : " + bizDao.getBizById(planOrderVO.getBizId()).getBizName()
					+ "<br/>통신망 : ";
			switch (planOrderVO.getNetNo()) {
				case 1: content += "KT망"; break;
				case 2: content += "SKT망"; break;
				case 3: content += "LGU+망"; break;
				default: break;
			}
			switch (planOrderVO.getGenNo()) {
				case 1: content += " 5G"; break;
				case 2: content += " LTE"; break;
				case 4: content += " 3G"; break;
				default: break;
			}
			content += "<br/>가입유형 : ";
			switch (planOrderVO.getJoinCategory()) {
				case "1": content += "번호이동"; break;
				case "2": content += "신규가입"; break;
				default: break;
			}
			content += "<br/>유심신청 : ";
			switch (planOrderVO.getSimYn()) {
				case "1": content += "Y"; break;
				case "2": content += "N"; break;
				default: break;
			}
			content += "<br/>유심유형 : ";
			switch (planOrderVO.getSimType()) {
				case "1": content += "일반유심"; break;
				case "2": content += "NFC유심"; break;
				default: break;
			}
			content += "<br/><br/>납부정보"
					+ "<br/>월 납부액 : " + planOrderVO.getOrderPrice();
			switch (planOrderVO.getPlanPay()) {
				case "1": content += "<br/>납부방법 : 카드결제"; break;
				case "2": content += "<br/>납부방법 : 계좌이체"; break;
				default: break;
			}
			
			helper.setFrom(from);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// --------------
		
		dao.insertPlanOrder(planOrderVO);
	}
	
	// 카드 정보 저장
	@Override
	public void insertPayinfoCard(PayCardVo payCardVo) throws Exception {
		dao.insertPayinfoCard(payCardVo);
	}
	
	// 계좌 정보 저장
	@Override
	public void insertPayinfoAcc(PayAccVo payAccVo) throws Exception {
		dao.insertPayinfoAcc(payAccVo);
	}

}

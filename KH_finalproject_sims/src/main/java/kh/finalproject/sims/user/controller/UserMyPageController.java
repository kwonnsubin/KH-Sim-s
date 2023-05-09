package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;
import kh.finalproject.sims.apiTest.kakao.KakaoService;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.service.UserMemberService;
import kh.finalproject.sims.user.model.service.UserMyPageService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Controller
public class UserMyPageController {
	
	@Autowired
	private UserMyPageService service;
	
	@Autowired
	private UserMemberService userMemberService;
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/mypage")
	public ModelAndView myPage(ModelAndView mv, Principal prin) throws Exception {
		String userId = prin.getName();
		String username = userMemberService.getUserName(userId);
		
		int reviewCnt = service.selectOrderListCount(userId);
		int myPlanCnt = service.selectMyPlanListCount(userId);
		int recentCnt = service.selectRecentListCount(userId);
		int likeCnt = service.selectLikeListCount(userId);
		
		HashMap<String, Object> cnt = new HashMap<>();
		cnt.put("reviewCnt", reviewCnt);
		cnt.put("myPlanCnt", myPlanCnt);
		cnt.put("recentCnt", recentCnt);
		cnt.put("likeCnt", likeCnt);
		
		mv.addObject("username", username);
		mv.addObject("cnt", cnt);
		
		mv.setViewName("main/mypage");
		
		return mv;
	}
	
	// 계정 탈퇴
	@ResponseBody
	@PostMapping("/mypage/disable")
	public String updateDisable(ModelAndView mv, @RequestParam String id) throws Exception {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rel", service.updateDisable(id));
		
		return new Gson().toJson(result);
	}
	
	// 내 정보 페이지
	@GetMapping("/mypage/myinfo")
	public ModelAndView selectMyPageInfo(ModelAndView mv, Principal prin) throws Exception {
		
		String userId = prin.getName();
		UserMemberVo userVo = service.selectMyPageInfo(userId);
		
		mv.addObject("userInfo", userVo);
		mv.setViewName("user/myinfo/myinfo");
		
		return mv;
	}
	
	// 내 정보 페이지 수정
	@PostMapping("/mypage/myinfo")
	public ModelAndView updateMyPageModify(ModelAndView mv, HttpSession session, MemberVo memVo, UserMemberVo userVo) throws Exception {
		
		userVo.setUserId(memVo.getId());
		if(memVo.getPw() != null) {
			memVo.setPw(pwEncoder.encode(memVo.getPw()));
		}
		
		service.updateMyPageModify(memVo, userVo);
		
		if((String)session.getAttribute("kakaoToken") != null) {
			kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
			session.setAttribute("kakaoToken", null);
		}
		
		mv.setViewName("redirect:/logout");
		
		return mv;
	}
	
	// 내 정보 비밀번호 확인
	@ResponseBody
	@PostMapping("/mypage/infopw")
	public String infoPasswordCheck(ModelAndView mv, @RequestParam String password, Principal prin) throws Exception {

		String userId = prin.getName();
		String myPw = service.infoPasswordCheck(userId);
		
		int result = 0;
		if(pwEncoder.matches(password, myPw)) {
			result = 1;
		} else {
			result = 0;
		}
		
		return new Gson().toJson(result);
	}
	
	// 공지사항
	@GetMapping("/noticelist")
	public ModelAndView selectNoticeList(ModelAndView mv) throws Exception {
		
		List<AdminNoticeMngtVo> ntcList = service.selectNoticeList();
		mv.addObject("ntcList", ntcList);
		
		mv.setViewName("user/myinfo/noticelist");
		
		return mv;
	}
	
	// 공지사항 글
	@GetMapping("/notice/{number}")
	public ModelAndView selectNoticeDetail(ModelAndView mv, @PathVariable int number) throws Exception {
		
		AdminNoticeMngtVo ntc = service.selectNoticeDetail(number);
		mv.addObject("ntc", ntc);
		mv.setViewName("user/myinfo/notice");
		
		return mv;
	}
	
	// 가입한 요금제 리뷰
	@GetMapping("/mypage/review")
	public ModelAndView selectReviewList(ModelAndView mv, Principal prin) throws Exception {
		String userId = prin.getName();
		List<BizApplyVo> poList = service.selectOrderList(userId);
		List<BizReviewMngtVo> reviewList = service.selectReviewList(userId);
		
		mv.addObject("poList", poList);
		mv.addObject("reviewList", reviewList);
		mv.setViewName("user/myinfo/review");
		
		return mv;
	}
	
	// 가입한 요금제 리뷰 작성
	@ResponseBody
	@PostMapping("/mypage/review/write")
	public String insertReview(Principal prin, BizReviewMngtVo brVo) throws Exception {
		String userId = prin.getName();
		brVo.setUserId(userId);
		
		int num = service.insertReview(brVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		
		return new Gson().toJson(result);
	}
	
	// 가입한 요금제 리뷰 수정
	@ResponseBody
	@PostMapping("/mypage/review/update")
	public String updateReview(BizReviewMngtVo brVo) throws Exception {
		int num = service.updateReview(brVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		
		return new Gson().toJson(result);
	}
	
	// 가입한 요금제 리뷰 삭제
	@ResponseBody
	@PostMapping("/mypage/review/delete")
	public String deleteReview(BizReviewMngtVo brVo) throws Exception {
		int num = service.deleteReview(brVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		
		return new Gson().toJson(result);
	}
	
	// 가입한 요금제
	@GetMapping("/mypage/myplan")
	public ModelAndView selectMyPlanList(ModelAndView mv, Principal prin) throws Exception {
		String userId = prin.getName();
		List<BizApplyVo> orderList = service.selectMyPlanListOrder(userId);
		List<BizApplyVo> acceptList = service.selectMyPlanListAccept(userId);
		List<BizApplyVo> holdList = service.selectMyPlanListHold(userId);
		
		mv.addObject("orderList", orderList);
		mv.addObject("acceptList", acceptList);
		mv.addObject("holdList", holdList);
		mv.setViewName("user/myinfo/myplan");
		
		return mv;
	}
	
	// 가입한 요금제 상세
	@GetMapping("/mypage/myplan/{orderNo}")
	public ModelAndView selectMyPlanDetail(ModelAndView mv, Principal prin, @PathVariable int orderNo) throws Exception {
		HashMap<String, Object> searchOrder = new HashMap<>();
		searchOrder.put("userId", prin.getName());
		searchOrder.put("orderNo", orderNo);
		
		BizApplyVo poVo = service.selectMyPlanDetail(searchOrder);
		
		mv.addObject("poVo", poVo);
		mv.setViewName("user/myinfo/myplandetail");
		
		return mv;
	}
	
	// 최근 본 요금제
	@GetMapping("/mypage/recent")
	public ModelAndView selectRecentList(ModelAndView mv, Principal prin) throws Exception {
		String userId = prin.getName();
		List<PlanVo> recentList = service.selectRecentList(userId);
		
		mv.addObject("recentList", recentList);
		mv.setViewName("user/myinfo/recent");
		
		return mv;
	}
	
	// 찜한 요금제
	@GetMapping("/mypage/like")
	public ModelAndView selectLikeList(ModelAndView mv, Principal prin) throws Exception {
		String userId = prin.getName();
		List<PlanVo> likeList = service.selectLikeList(userId);
		
		mv.addObject("likeList", likeList);
		mv.setViewName("user/myinfo/like");
		
		return mv;
	}
		
}

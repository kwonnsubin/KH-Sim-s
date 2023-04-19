package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

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
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.user.model.service.UserMyPageService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Controller
public class UserMyPageController {
	
	@Autowired
	private UserMyPageService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/mypage")
	public ModelAndView myPage(ModelAndView mv, Principal prin) {
		String userId = prin.getName();
		int reviewCnt = service.selectOrderListCount(userId);
		int myPlanCnt = service.selectMyPlanListCount(userId);
		int recentCnt = service.selectRecentListCount(userId);
		
		HashMap<String, Object> cnt = new HashMap<>();
		cnt.put("reviewCnt", reviewCnt);
		cnt.put("myPlanCnt", myPlanCnt);
		cnt.put("recentCnt", recentCnt);
		
		mv.addObject("cnt", cnt);
		mv.setViewName("main/mypage");
		
		return mv;
	}
	
	// 계정 탈퇴
	@ResponseBody
	@PostMapping("/mypage/disable")
	public String updateDisable(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rel", service.updateDisable(id));
		
		return new Gson().toJson(result);
	}
	
	// 내 정보 페이지
	@GetMapping("/mypage/myinfo/{id}")
	public ModelAndView selectMyPageInfo(ModelAndView mv, @PathVariable String id) {
		
		UserMemberVo userVo = service.selectMyPageInfo(id);
		
		mv.addObject("userInfo", userVo);
		mv.setViewName("user/myinfo/myinfo");
		
		return mv;
	}
	
	// 내 정보 페이지 수정
	@PostMapping("/mypage/myinfo")
	public ModelAndView updateMyPageModify(ModelAndView mv, MemberVo memVo, UserMemberVo userVo) {
		
		userVo.setUserId(memVo.getId());
		memVo.setPw(pwEncoder.encode(memVo.getPw()));
		
		service.updateMyPageModify(memVo, userVo);
		
		mv.setViewName("redirect:/logout");
		
		return mv;
	}
	
	// 공지사항
	@GetMapping("/noticelist")
	public ModelAndView selectNoticeList(ModelAndView mv) {
		
		List<AdminNoticeMngtVo> ntcList = service.selectNoticeList();
		mv.addObject("ntcList", ntcList);
		
		mv.setViewName("user/myinfo/noticelist");
		
		return mv;
	}
	
	// 공지사항 글
	@GetMapping("/notice/{number}")
	public ModelAndView selectNoticeDetail(ModelAndView mv, @PathVariable int number) {
		
		AdminNoticeMngtVo ntc = service.selectNoticeDetail(number);
		mv.addObject("ntc", ntc);
		mv.setViewName("user/myinfo/notice");
		
		return mv;
	}
	
	// 가입한 요금제 리뷰
	@GetMapping("/mypage/review")
	public ModelAndView selectReviewList(ModelAndView mv, Principal prin) {
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
	public String insertReview(Principal prin, BizReviewMngtVo brVo) {
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
	public String updateReview(BizReviewMngtVo brVo) {
		int num = service.updateReview(brVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		
		return new Gson().toJson(result);
	}
	
	// 가입한 요금제 리뷰 삭제
	@ResponseBody
	@PostMapping("/mypage/review/delete")
	public String deleteReview(BizReviewMngtVo brVo) {
		int num = service.deleteReview(brVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		
		return new Gson().toJson(result);
	}
	
	// 가입한 요금제
	@GetMapping("/mypage/myplan")
	public ModelAndView selectMyPlanList(ModelAndView mv, Principal prin) {
		String userId = prin.getName();
		List<BizApplyVo> poList = service.selectMyPlanList(userId);
		
		mv.addObject("poList", poList);
		mv.setViewName("user/myinfo/myplan");
		
		return mv;
	}
	
	// 가입한 요금제 상세
	@GetMapping("/mypage/myplan/{orderNo}")
	public ModelAndView selectMyPlanDetail(ModelAndView mv, Principal prin, @PathVariable int orderNo) {
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
	public ModelAndView selectRecentList(ModelAndView mv, Principal prin) {
		String userId = prin.getName();
		List<PlanVo> recentList = service.selectRecentList(userId);
		
		mv.addObject("recentList", recentList);
		mv.setViewName("user/myinfo/recent");
		
		return mv;
	}
	
	// 찜한 요금제
	@GetMapping("/mypage/like")
	public ModelAndView selectLikeList(ModelAndView mv, Principal prin) {
		String userId = prin.getName();
		List<PlanVo> likeList = service.selectLikeList(userId);
		
		mv.addObject("likeList", likeList);
		mv.setViewName("user/myinfo/like");
		
		return mv;
	}
		
}

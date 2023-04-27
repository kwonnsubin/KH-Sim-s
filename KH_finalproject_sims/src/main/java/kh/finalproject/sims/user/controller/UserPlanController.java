package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserBizService;
import kh.finalproject.sims.user.model.service.UserMyPageService;
import kh.finalproject.sims.user.model.service.UserPlanService;
import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.LikeVo;
import kh.finalproject.sims.user.model.vo.PayAccVo;
import kh.finalproject.sims.user.model.vo.PayCardVo;
import kh.finalproject.sims.user.model.vo.PlanOrderVo;
import kh.finalproject.sims.user.model.vo.PlanVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;
import kh.finalproject.sims.user.model.vo.UserReviewVo;

@Controller
@RequestMapping("/plan")
public class UserPlanController {

	@Autowired
	private UserPlanService planService;
	@Autowired
	private UserBizService bizService;
	@Autowired
	private UserMyPageService myService;
	
	@GetMapping("/{planNo}")
	public ModelAndView viewPlanDetail(
			ModelAndView mv
			, HttpServletRequest req
			, @PathVariable int planNo
			) {
		
		// 최근 본 요금제 추가
		if(req.getUserPrincipal() != null && req.isUserInRole("ROLE_USER")) {
			Principal prin = req.getUserPrincipal();
			HashMap<String, Object> recentInfo = new HashMap<>();
			recentInfo.put("userId", prin.getName());
			recentInfo.put("planNo", planNo);
			planService.insertRecentInfo(recentInfo);
		}
		//
		
		PlanVo pvo = planService.getPlanByNo(planNo);
		BizVo bvo = bizService.getBizByName(pvo.getBizName());
		List<UserReviewVo> reviewList = bizService.getReviewListById(bvo.getBizId());
		
		mv.addObject("bizNets", bizService.getNetListByBizId(bvo.getBizId()));
		mv.addObject("cntReview", bizService.getCountReviewByBizId(bvo.getBizId()));
		
		mv.addObject("plan", pvo);
		mv.addObject("biz", bvo);
		mv.addObject("reviewList", reviewList);
		
		mv.setViewName("user/plan/detail");
		return mv;
	}
	
	// 약관 페이지
	@GetMapping("/{planNo}/order/terms")
	public ModelAndView viewTerms(
			ModelAndView mv
			, @PathVariable int planNo
			) {
		PlanVo pvo = planService.getPlanByNo(planNo);
		mv.addObject("plan", pvo);
		mv.setViewName("user/plan/terms");
		return mv;
	}
	
	// 신청 옵션 페이지
	@GetMapping("/{planNo}/order/option")
	public ModelAndView viewPlanOption(
			ModelAndView mv
			, @PathVariable int planNo
			) {
		PlanVo pvo = planService.getPlanByNo(planNo);
		mv.addObject("plan", pvo);
		mv.setViewName("user/plan/option");
		return mv;
	}
	
	// 신청서 작성 페이지
	@GetMapping("/{planNo}/order")
	public ModelAndView viewPlanOrder(
			ModelAndView mv
			, @PathVariable int planNo
			, Principal principal
			) {
		String userId = principal.getName();
		UserMemberVo mvo = myService.selectMyPageInfo(userId);
		PlanVo pvo = planService.getPlanByNo(planNo);
		mv.addObject("plan", pvo);
		mv.addObject("user", mvo);
		
		mv.setViewName("user/plan/order");
		return mv;
	}
	
	// 신청서 저장
	@PostMapping("/{planNo}/order")
	@Transactional
	public String savePlanOrder(
			@PathVariable int planNo
			, @ModelAttribute PlanOrderVo orderVo
			, @ModelAttribute PayCardVo cardVo
			, @ModelAttribute PayAccVo accVo
			) {
		int orderNo = planService.selectOrderNo();
		orderVo.setOrderNo(orderNo);
		planService.insertPlanOrder(orderVo);
        if (orderVo.getPlanPay().equals("1")) {
        	cardVo.setOrderNo(orderNo);
        	planService.insertPayinfoCard(cardVo);
		} else if (orderVo.getPlanPay().equals("2")) {
			accVo.setOrderNo(orderNo);
			planService.insertPayinfoAcc(accVo);
		}
        return "redirect:/";
	}
	
	// 찜하기
	@PostMapping("/{planNo}/like")
	@ResponseBody
	public int likePlan(
	        HttpServletRequest req
	        , @PathVariable int planNo
	        ) {
	    Principal prin = req.getUserPrincipal();
	    String userId = prin.getName();
	    boolean isLiked = planService.getLikeByPlanWithUser(planNo, userId);
	    if (isLiked) {
	        planService.deleteLike(planNo, userId);
	        return 0; // 찜 취소
	    } else {
	        LikeVo like = new LikeVo();
	        like.setPlanNo(planNo);
	        like.setUserId(userId);
	        planService.insertLike(like);
	        return 1; // 찜 추가
	    }
	}

}

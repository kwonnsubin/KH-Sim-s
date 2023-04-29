package kh.finalproject.sims;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;
import kh.finalproject.sims.biz.model.service.BizReviewMngtService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;
import kh.finalproject.sims.user.model.service.UserMemberService;
import kh.finalproject.sims.user.model.service.UserPlanFindService;
import kh.finalproject.sims.user.model.vo.PlanVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserPlanFindService userPlanFindService;
	
	@Autowired
	private BizInfoMngtService bizInfoService;
	
	@Autowired
	private BizReviewMngtService bizReviewMngtService;
	
	@Autowired
	private UserMemberService userMemberService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView mainPage(ModelAndView mv, HttpServletRequest req) {
		
		if(req.getUserPrincipal() != null && req.isUserInRole("ROLE_USER")) {
			Principal prin = req.getUserPrincipal();
			String userId = prin.getName();
			String username = userMemberService.getUserName(userId);
			mv.addObject("username", username);
		}
		
		List<PlanVo> viewRankList = userPlanFindService.selectViewRankList();
		List<PlanVo> likeRankList = userPlanFindService.selectLikeRankList();
		List<PlanVo> orderRankList = userPlanFindService.selectOrderRankList();
		List<BizInfoMngtVo> bizList = userPlanFindService.selectBizIdList();
		
		mv.addObject("viewRankList", viewRankList);
		mv.addObject("likeRankList", likeRankList);
		mv.addObject("orderRankList", orderRankList);
		mv.addObject("bizList", bizList);
		
		mv.setViewName("home");
		
		return mv;
	}
	
	@GetMapping("bizinfo/{bizId}")
	public ModelAndView authdiv(ModelAndView mv, @PathVariable String bizId) {
		
		BizInfoMngtVo bizInfo = bizInfoService.selectMainBizInfo(bizId);
		List<bizInfoMngServiceVo> bizService = bizInfoService.selectListService(bizId);
		List<PlanVo> bizPlanList = userPlanFindService.selectBizPlanList(bizId);
		List<BizReviewMngtVo> bizReviewList = bizReviewMngtService.selectBizReviewList(bizId);
		
		mv.addObject("bizInfo", bizInfo);
		mv.addObject("bizService", bizService);
		mv.addObject("planList", bizPlanList);
		mv.addObject("bizReviewList", bizReviewList);
		
		mv.setViewName("/main/telinfo");
		return mv;
	}
	
	@GetMapping("/authdiv")
	public ModelAndView authdiv(ModelAndView mv, HttpServletRequest req) {
		
		if(req.isUserInRole("ROLE_USER")) {
			mv.setViewName("redirect:/");
		} else if(req.isUserInRole("ROLE_ADMIN")) {
			mv.setViewName("redirect:/admin/dashboard");
		} else if(req.isUserInRole("ROLE_BIZ")) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
}

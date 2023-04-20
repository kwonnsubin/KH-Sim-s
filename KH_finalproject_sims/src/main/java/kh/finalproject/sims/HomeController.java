package kh.finalproject.sims;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserPlanFindService;
import kh.finalproject.sims.user.model.service.UserPlanService;
import kh.finalproject.sims.user.model.vo.PlanVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserPlanFindService userPlanFindService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, Principal principal) {
		
		if(principal != null) {
			String username = principal.getName();
			mv.addObject("username", username);
		}
		
		List<PlanVo> viewRankList = userPlanFindService.selectViewRankList();
		List<PlanVo> likeRankList = userPlanFindService.selectLikeRankList();
		List<PlanVo> orderRankList = userPlanFindService.selectOrderRankList();
		
		mv.addObject("viewRankList", viewRankList);
		mv.addObject("likeRankList", likeRankList);
		mv.addObject("orderRankList", orderRankList);
		mv.setViewName("home");
		
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
	
	@GetMapping("/chain")
	public String temp() {
		return "chain";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
}

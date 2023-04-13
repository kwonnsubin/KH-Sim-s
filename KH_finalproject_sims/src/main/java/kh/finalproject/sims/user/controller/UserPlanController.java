package kh.finalproject.sims.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserBizService;
import kh.finalproject.sims.user.model.service.UserPlanService;
import kh.finalproject.sims.user.model.vo.BizVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Controller
@RequestMapping("/plan")
public class UserPlanController {

	@Autowired
	private UserPlanService planService;
	@Autowired
	private UserBizService bizService;
	
	@GetMapping("/{planNo}")
	public ModelAndView viewPlanDetail(
			ModelAndView mv
			, @PathVariable int planNo
			) {
		PlanVo pvo = planService.getPlanByNo(planNo);
		mv.addObject("plan", pvo);
		
		BizVo bvo = bizService.getBizByName(pvo.getBizName());
		mv.addObject("biz", bvo);
		
		List<String> bizNets = bizService.getNetByBizId(bvo.getBizId());
		mv.addObject("bizNets", bizNets);
		
		mv.setViewName("user/plan/detail");
		return mv;
	}
}

package kh.finalproject.sims.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.service.UserPlanFindService;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Controller
public class UserPlanFindController {
	
	@Autowired
	private UserPlanFindService service;
	
	@GetMapping("/plans")
	public ModelAndView plan(ModelAndView mv) {
		List<PlanVo> planList = service.selectPlanList();
		int cnt = service.cntPlanList();
		
		List<BizInfoMngtVo> bizList = service.selectBizNameList();
		
		mv.addObject("bizList", bizList);
		mv.addObject("planList", planList);
		mv.addObject("cnt", cnt);
		mv.setViewName("user/plan/plans");
		
		return mv;
	}

}

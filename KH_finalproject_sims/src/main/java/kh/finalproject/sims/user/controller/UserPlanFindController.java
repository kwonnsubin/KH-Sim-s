package kh.finalproject.sims.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserPlanFindService;

@Controller
public class UserPlanFindController {
	
	@Autowired
	private UserPlanFindService service;
	
	@GetMapping("/plans")
	public ModelAndView plan(ModelAndView mv) {
		mv.setViewName("user/plan/plans");
		
		return mv;
	}

}

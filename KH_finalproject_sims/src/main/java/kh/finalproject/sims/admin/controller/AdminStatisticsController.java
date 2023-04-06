package kh.finalproject.sims.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminStatisticsService;

@Controller
@RequestMapping("/admin")
public class AdminStatisticsController {
	@Autowired
	AdminStatisticsService service;
	
	@GetMapping("/statistics")
	public ModelAndView selectOrderByRegistration(
			ModelAndView mv
			) {
		mv.addObject("orderByRegistration", service.selectOrderByRegistration());
		mv.setViewName("/admin/statistics");
		return mv;
		
	}
}

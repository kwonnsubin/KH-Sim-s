package kh.finalproject.sims.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminDashBoardService;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;


@RequestMapping("/admin")
@Controller
public class AdminDashBoardController {
	
	@Autowired
	AdminDashBoardService service;
	
	@GetMapping("/dashboard")
		public ModelAndView selectDashBoard(ModelAndView mv) {
		List<AdminReviewMngtVo> bizReviewList = service.selectDashboardBizReview();
		System.out.println("@@@@@@@@@@@"+bizReviewList);
		mv.addObject("bizReviewList", bizReviewList);
		mv.setViewName("admin/dashboard");
		return mv;		
		}
		
}



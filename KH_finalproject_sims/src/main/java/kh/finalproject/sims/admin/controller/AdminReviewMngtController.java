package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminReviewMngtService;

@RequestMapping("/admin")
@Controller
public class AdminReviewMngtController {
	@Autowired
	AdminReviewMngtService service;
	
	// 신고 리뷰 목록
	@GetMapping("/reviewreportlist")
	public ModelAndView selectReviewReportList(ModelAndView mv) {
		mv.addObject("reviewReportList", service.selectReviewReportList());
		mv.setViewName("admin/reviewreportlist");
		return mv;
	}	
}

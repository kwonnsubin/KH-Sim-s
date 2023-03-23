package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminNoticeMngtService;

@RequestMapping("/adminNotice")
@Controller
public class AdminNoticeMngtController {
	
	@Autowired
	private AdminNoticeMngtService service;
	
	
	@GetMapping("/noticeList")
	public ModelAndView selectNoticeList(ModelAndView mv) {
		mv.addObject("noticeList",service.selectNoticeList());
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}
}

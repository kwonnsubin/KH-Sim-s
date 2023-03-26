package kh.finalproject.sims.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/biz")
public class BizMainController {
	
	//통신사 마이페이지 메인
	@RequestMapping("/main")
	public ModelAndView showMainBoard(ModelAndView mv) {
		mv.setViewName("/biz/main");
		return mv;
	}
	
}

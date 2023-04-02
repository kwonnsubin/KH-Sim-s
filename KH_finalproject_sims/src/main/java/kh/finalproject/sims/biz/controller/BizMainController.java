package kh.finalproject.sims.biz.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;

@Controller
@RequestMapping("/biz")
public class BizMainController {
	
	@Autowired
	private BizInfoMngtService service;
	
	//통신사 마이페이지 메인
	@RequestMapping("/main")
	public ModelAndView showMainBoard(ModelAndView mv
			, HttpServletRequest request
			) {
		
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		//TODO 통신사 로고이미지 가지고 오기
		//service.findByBizLogo(bizid);
		
		mv.setViewName("/biz/main");
		return mv;
	}
	
}

package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.vo.AdminLoginVo;
import kh.finalproject.sims.admin.model.service.AdminLoginService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@Autowired
	private AdminLoginService service;
		
	@GetMapping("/login")
		public ModelAndView viewlogin(ModelAndView mv) {
			mv.setViewName("admin/login");
			return mv;
		}
	
	
	@PostMapping("/login")
		public ModelAndView dologin(
				ModelAndView mv,
				AdminLoginVo vo
				) {

				
		AdminLoginVo result = service.doLogin(vo);
				
				if(result != null) { // 로그인 성공
					mv.setViewName("/home");
				
				} else { // 로그인 실패
					mv.setViewName("/home");
				}
			return mv;
	}
	
}

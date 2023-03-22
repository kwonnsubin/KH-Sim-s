package kh.finalproject.sims.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserMemberController {

	@GetMapping("login")
	public ModelAndView LoginDo(ModelAndView mv) {
		
		mv.setViewName("main/login");
		
		return mv;
	}
	
	@GetMapping("signup")
	public ModelAndView selectSignUp(ModelAndView mv) {
		
		mv.setViewName("main/signup");
		
		return mv;
	} 
	
}

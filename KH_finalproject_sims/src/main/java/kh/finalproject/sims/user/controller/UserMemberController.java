package kh.finalproject.sims.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.apiTest.mail.MailSendService;
import kh.finalproject.sims.user.model.service.UserMemberService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Controller
public class UserMemberController {
	
	@Autowired
	private UserMemberService service;
	
	@Autowired
	private MailSendService mailService;

	@GetMapping("login")
	public ModelAndView LoginDo(ModelAndView mv) {
		
		mv.setViewName("main/login");
		
		return mv;
	}
	
	@GetMapping("signup")
	public ModelAndView signUp(ModelAndView mv) {
		
		mv.setViewName("main/signup");
		
		return mv;
	}
	
	@PostMapping("signup")
	public ModelAndView insertSignUp(ModelAndView mv, MemberVo memVo, UserMemberVo userVo) {
		
		int result = service.insertSignUp(memVo, userVo);
		
		if(result == 1) {
			mv.setViewName("main/login");
		} else {
			mv.setViewName("mail/signup");
		}
		
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("signup/idcheck")
	public String selectIdCheck(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("idCheck", service.selectIdCheck(id));
		
		return new Gson().toJson(result);
	}
	
	//이메일 인증
	@RequestMapping(value = "/emailCheck")
	@ResponseBody
	public String selectEmailCertify(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
}

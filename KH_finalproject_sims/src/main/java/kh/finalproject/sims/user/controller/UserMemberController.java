package kh.finalproject.sims.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.user.model.service.UserMemberService;

@Controller
public class UserMemberController {
	
	@Autowired
	private UserMemberService service;

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
	
	@ResponseBody
	@PostMapping("signup/idcheck")
	public String selectIdCheck(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("idCheck", service.selectIdCheck(id));
		
		return new Gson().toJson(result);
	}
	
}

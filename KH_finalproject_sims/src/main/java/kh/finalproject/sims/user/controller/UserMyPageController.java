package kh.finalproject.sims.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.user.model.service.UserMyPageService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Controller
@RequestMapping("/mypage")
public class UserMyPageController {
	
	@Autowired
	private UserMyPageService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("")
	public ModelAndView myPage(ModelAndView mv) {
		
		mv.setViewName("main/mypage");
		
		return mv;
	}
	
	// 계정 탈퇴
	@ResponseBody
	@PostMapping("/disable")
	public String updateDisable(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rel", service.updateDisable(id));
		
		return new Gson().toJson(result);
	}
	
	// 내 정보 페이지
	@GetMapping("/myinfo/{id}")
	public ModelAndView selectMyPageInfo(ModelAndView mv, @PathVariable String id) {
		
		UserMemberVo userVo = service.selectMyPageInfo(id);
		
		mv.addObject("userInfo", userVo);
		mv.setViewName("user/myinfo/myinfo");
		
		return mv;
	}
	
	// 내 정보 페이지 수정
	@PostMapping("/myinfo")
	public ModelAndView updateMyPageModify(ModelAndView mv, MemberVo memVo, UserMemberVo userVo) {
		
		userVo.setUserId(memVo.getId());
		memVo.setPw(pwEncoder.encode(memVo.getPw()));
		
		service.updateMyPageModify(memVo, userVo);
		
		mv.setViewName("redirect:/logout");
		
		return mv;
	}
	
}

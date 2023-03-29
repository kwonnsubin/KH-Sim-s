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

import kh.finalproject.sims.api.mail.MailSendService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.service.UserMemberService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;

@Controller
public class UserMemberController {
	
	@Autowired
	private UserMemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 로그인 페이지
	@GetMapping("login")
	public ModelAndView LoginDo(ModelAndView mv) {
		mv.setViewName("main/login");
		
		return mv;
	}
	
	// 회원가입 페이지
	@GetMapping("signup")
	public ModelAndView signUp(ModelAndView mv) {
		mv.setViewName("main/signup");
		
		return mv;
	}
	
	// 회원가입
	@PostMapping("signup")
	public ModelAndView insertSignUp(ModelAndView mv, MemberVo memVo, UserMemberVo userVo, BizInfoMngtVo bizVo) {
		memVo.setEnable(1);
		
		String encPw = pwEncoder.encode(memVo.getPw());
		memVo.setPw(encPw);
		
		int result = 0;
		if(memVo.getRole().equals("ROLE_USER")) {
			userVo.setUserId(memVo.getId());
			result = service.insertUserSignUp(memVo, userVo);
		} else {
			bizVo.setBizId(memVo.getId());
			result = service.insertBizSignUp(memVo, bizVo);
		}
		
		
		if(result == 1) {
			mv.setViewName("redirect:/login");
		} else {
			mv.setViewName("redirect:/signup");
		}
		
		return mv;
	}
	
	// 아이디 찾기 페이지
	@GetMapping("findid")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("main/findid");
		
		return mv;
	}
	
	// 아이디 찾기
	@PostMapping("findid")
	public ModelAndView selectFindId(ModelAndView mv, MemberVo memVo, UserMemberVo userVo, BizInfoMngtVo bizVo) {
		
		MemberVo result = null;
		if(memVo.getRole().equals("ROLE_USER")) {
			result = service.selectFindId(userVo);
		} else {
			result = service.selectFindId(bizVo);
		}
		
		if(result == null) {
			mv.addObject("msg", "해당 정보에 맞는 아이디가 없습니다.");
			mv.setViewName("main/findid");
		} else {
			mv.addObject("resultId", result.getId());
			if(result.getEnable() == 2) {
				mv.addObject("resultEna", result.getEnable());
			}
			mv.setViewName("main/findid");
		}
		
		return mv;
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("findpw")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("main/findpw");
		
		return mv;
	}
	
	// 비밀번호 찾기
	@PostMapping("findpw")
	public ModelAndView selectFindPw(ModelAndView mv, MemberVo memVo, UserMemberVo userVo, BizInfoMngtVo bizVo) {
		
		int result = 0;
		if(memVo.getRole().equals("ROLE_USER")) {
			userVo.setUserId(memVo.getId());
			result = service.selectFindPw(userVo);
		} else {
			bizVo.setBizId(memVo.getId());
			result = service.selectFindPw(bizVo);
		}
		
		if(result == 0) {
			mv.addObject("msg", "해당 정보에 맞는 계정이 없습니다.");
			mv.setViewName("main/findpw");
		} else {
			mv.addObject("resultId", memVo.getId());
			mv.setViewName("main/findpw");
		}
		
		return mv;
	}	
	
	// 비밀번호 재설정
	@ResponseBody
	@PostMapping("findpw/changepw")
	public String changePw(ModelAndView mv, @RequestParam String id, @RequestParam String pw) {

		MemberVo memVo = new MemberVo();
		
		memVo.setId(id);
		memVo.setPw(pwEncoder.encode(pw));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("changePw", service.changePw(memVo));
		
		return new Gson().toJson(result);
	}
	
	// ID 중복 확인
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
	
	// 계정 복구
	@ResponseBody
	@PostMapping("enable")
	public String updateEnable(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rel", service.updateEnable(id));
		
		return new Gson().toJson(result);
	}
	
	// 계정 탈퇴
	@ResponseBody
	@PostMapping("disable")
	public String updateDisable(ModelAndView mv, @RequestParam String id) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rel", service.updateDisable(id));
		
		return new Gson().toJson(result);
	}
	
	// 내 정보 페이지
	@GetMapping("myinfo/{id}")
	public ModelAndView selectMyPageInfo(ModelAndView mv, @PathVariable String id) {
		
		UserMemberVo userVo = service.selectMyPageInfo(id);
		
		mv.addObject("userInfo", userVo);
		mv.setViewName("user/myinfo");
		
		return mv;
	}
	
	// 내 정보 페이지 수정
	@PostMapping("myinfo")
	public ModelAndView updateMyPageModify(ModelAndView mv, MemberVo memVo, UserMemberVo userVo) {
		
		userVo.setUserId(memVo.getId());
		memVo.setPw(pwEncoder.encode(memVo.getPw()));
		
		service.updateMyPageModify(memVo, userVo);
		
		mv.setViewName("redirect:/logout");
		
		return mv;
	}
	
}

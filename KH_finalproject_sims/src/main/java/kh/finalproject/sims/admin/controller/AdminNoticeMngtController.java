package kh.finalproject.sims.admin.controller;

import java.security.Principal;
import java.security.Provider.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminNoticeMngtService;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@RequestMapping("/adminNotice") //admin으로 변경해주세요.
@Controller
public class AdminNoticeMngtController {
	
	@Autowired
	private AdminNoticeMngtService service;
	
	// 신고 리뷰 목록
	@GetMapping("/reviewreportlist")
	public ModelAndView selectReviewReportList(ModelAndView mv) {
		mv.addObject("reviewReportList", service.selectReviewReportList());
		mv.setViewName("admin/reviewreportlist");
		return mv;
	}	

	//관리자 공지사항 리스트로 이동
	@GetMapping("/noticeList")
	public ModelAndView selectNoticeList(ModelAndView mv) {
		mv.addObject("noticeList",service.selectNoticeList());
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}
	

	//관리자 공지사항 상세 페이지로 이동
	@GetMapping("/noticeDetail/{ntcNo}")
	public ModelAndView selectNoticeDetail(ModelAndView mv,@PathVariable int ntcNo) {
		mv.addObject("noticeDetail",service.selectNoticeDetail(ntcNo));
		mv.setViewName("admin/notice/noticeDetail");
		return mv;
	}
	
	//관리자 공지사항 글 작성 페이지로 이동
	@GetMapping("/noticeWrite")
	public ModelAndView selectNoticeWrite(ModelAndView mv, HttpServletRequest request ) {
		mv.setViewName("admin/notice/noticeWrite");
		
		Principal principal = request.getUserPrincipal(); 
		String username;
		
		if(principal != null) {    // 정상적으로 로그인을 했을 경우
			username = principal.getName();
			mv.addObject("username", username);
		} else {    // 로그인을 안 했을 경우 (테스트용)
			username = "관리자";
			mv.addObject("username", username);
		}
		 
		return mv;
	}
	
	//관리자 공지사항 글 작성
	@PostMapping("/saveNoticeWrite")
	public ModelAndView saveNoticeWrite(
			ModelAndView mv , AdminNoticeMngtVo vo) {
		service.insertNoticeWrite(vo);
		mv.setViewName("redirect:/adminNotice/noticeList");
		return mv;
	}
	

	
			
	
	

	
}



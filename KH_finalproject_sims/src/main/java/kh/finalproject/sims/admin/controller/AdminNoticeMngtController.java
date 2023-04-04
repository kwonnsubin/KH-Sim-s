package kh.finalproject.sims.admin.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalproject.sims.admin.model.service.AdminNoticeMngtService;
import kh.finalproject.sims.admin.model.vo.AdminNoticeMngtVo;

@RequestMapping("/admin")
@Controller
public class AdminNoticeMngtController {
	
	@Autowired
	private AdminNoticeMngtService service;
	
	//관리자 공지사항 리스트로 이동
	@RequestMapping(value="/noticeList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectNoticeList(ModelAndView mv, AdminNoticeMngtVo vo) {
		mv.addObject("noticeList",service.selectNoticeList(vo));
		mv.addObject("searchOption", vo.getSearchOption());
		mv.addObject("searchBox", vo.getSearchBox());
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}
	
	//관리자 공지사항 상세 페이지로 이동
	@GetMapping("/noticeDetail/{ntcNo}")
	public ModelAndView selectNoticeDetail(ModelAndView mv, @PathVariable int ntcNo) {
		AdminNoticeMngtVo noticeDetail = service.selectNoticeDetail(ntcNo);
		mv.addObject("noticeDetail", noticeDetail);
		mv.setViewName("admin/notice/noticeDetail");
		mv.addObject("cmd", "read");
		return mv;
	}

	// 관리자 공지사항 글 작성 페이지로 이동
	@GetMapping("/noticeWrite")
	public ModelAndView selectNoticeWrite(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("admin/notice/noticeWrite");

		Principal principal = request.getUserPrincipal();
		String username;
	
		if (principal != null) { // 정상적으로 로그인을 했을 경우
			username = principal.getName();
			mv.addObject("username", username);
		} else { // 로그인을 안 했을 경우 (테스트용)
			username = "관리자";
			mv.addObject("username", username);
		}
		mv.addObject("cmd", "write");

		return mv;
	}

	//관리자 공지사항 글 작성
	@PostMapping("/saveNoticeWrite")
	public ModelAndView saveNoticeWrite(
			ModelAndView mv , AdminNoticeMngtVo vo
			, RedirectAttributes rttr) {
		service.insertNoticeWrite(vo);
		
		int ntcNo = vo.getNtcNo();
		AdminNoticeMngtVo noticeDetail = service.selectNoticeDetail(ntcNo);
		mv.addObject("noticeDetail", noticeDetail);
		mv.addObject("result", "저장이 완료되었습니다.");
		mv.addObject("cmd", "read");
		mv.setViewName("/admin/notice/noticeDetail");
		return mv;
	}
		
	//관리자 공지사항 글 수정페이지로 이동
	@GetMapping("/selectNoticeModify/{ntcNo}")
	public ModelAndView selectNoticeModify(
			ModelAndView mv
			, @PathVariable int ntcNo
			, AdminNoticeMngtVo vo) {
		AdminNoticeMngtVo noticeDetail = service.selectNoticeDetail(ntcNo);
		mv.addObject("noticeDetail", noticeDetail);
		mv.addObject("cmd", "update");
		mv.setViewName("/admin/notice/noticeDetail");
		return mv;
	}
		
	//관리자 공지사항 글 수정하기
	@PostMapping("/saveNoticeModify")
	public ModelAndView saveNoticeModify(
		 ModelAndView mv
		, AdminNoticeMngtVo vo) {
		service.saveNoticeModify(vo);
		
		int ntcNo = vo.getNtcNo();
		AdminNoticeMngtVo noticeDetail = service.selectNoticeDetail(ntcNo);
		mv.addObject("noticeDetail", noticeDetail);
		mv.addObject("result", "수정이 완료되었습니다.");
		mv.addObject("cmd", "read");
		mv.setViewName("/admin/notice/noticeDetail");
		return mv;
	}
				
		
	//관리자 공지사항 글 삭제
	@GetMapping("/deleteNotice")
	public String deleteNotice(RedirectAttributes rttr, HttpServletRequest request) {
		int ntcNo = Integer.parseInt(request.getParameter("ntcNo"));

		service.deleteNotice(ntcNo);
		rttr.addFlashAttribute("result", "삭제가 완료되었습니다.");
		return "redirect:/adminNotice/noticeList";
	}
	
}



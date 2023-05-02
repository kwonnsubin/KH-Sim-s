package kh.finalproject.sims.admin.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminFaqMngtService;
import kh.finalproject.sims.admin.model.service.AdminQnaMngtService;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.common.page.Search;

@RequestMapping("/admin")
@Controller
public class AdminFaqMngtController {
	
	@Autowired
	AdminFaqMngtService service;

	// 자주묻는질문화면 리스트
	@RequestMapping(value="/faq/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectFaqList(
			ModelAndView mv
			, AdminFaqVo vo
			,@RequestParam(required = false) String keyword
			,@RequestParam(required = false) String searchType
			,@RequestParam(value = "p", required = false) String pageNumber
			, HttpServletRequest request 
			, HttpServletResponse response 
			) {
	    	
	  //페이징
	  		int pNum;
	  		if (pageNumber == null || pageNumber.isEmpty()) {
	  			pNum = 1;
	  		} else {
	  			pNum = Integer.parseInt(pageNumber);
	  		}
	  	
	  		Cookie cookie = null;
	  		Cookie[] cookies = request.getCookies();
	  		for (Cookie c : cookies) {
	  			if (c.getName().equals("cnt")) {
	  				cookie = c;
	  			}
	  		}
	  	
	  		String cnt = request.getParameter("cnt");
	  		if (cnt != null) {
	  			if (cnt.isEmpty()) {
	  				if (cookie != null) {
	  					cnt = cookie.getValue();
	  				} else {
	  					cnt = "10"; // 초기값
	  				}
	  			}
	  		} else {
	  			if (cookie != null) {
	  				cnt = cookie.getValue();
	  			} else {
	  				cnt = "10";
	  			}
	  		}
	  			  	
	  		cookie = new Cookie("cnt", cnt);
	  		cookie.setMaxAge(60 * 60 * 24 * 5);
	  		response.addCookie(cookie);	 
	  		
			Search search = service.getPage(pNum, Integer.parseInt(cnt), keyword, searchType);
			request.setAttribute("paging", search);
	    
	    mv.setViewName("admin/faq/list");
	    return mv;
	}
	
	// 자주묻는질문화면 상세내용 보기
	@GetMapping("/faq/detail/{faqNo}")
	public ModelAndView selectFaqDetail(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result);
		mv.setViewName("admin/faq/detail");
		return mv;
	}
	
	// 자주묻는질문화면 작성 페이지
	@GetMapping("/faq/write")
	public ModelAndView viewInsertFaq(
			  ModelAndView mv
			, HttpServletRequest request // 사용자(관리자)정보 가져오기
			) {
		mv.setViewName("admin/faq/write");
		Principal principal = request.getUserPrincipal(); // 사용자(관리자)정보 가져오기
	    String username = principal.getName(); // 사용자(관리자)정보 가져오기
	    
	    mv.addObject("username", username);
		return mv;
	}
	
	// 자주묻는질문 작성
	@PostMapping("/faq/write")
	public ModelAndView faqwrite(
			ModelAndView mv
		  , AdminFaqVo vo
			) {
	    // HTML 태그 제거
		String plainText = vo.getFaqContent().replaceAll("\\<.*?\\>", "");
		vo.setFaqContent(plainText);
		
		service.insertFaqWrite(vo);
		mv.setViewName("redirect:/admin/faq/list");
		return mv;
	}
	
	
	// 자주묻는질문 수정 페이지로 이동
	@GetMapping("/faq/update/{faqNo}")
	public ModelAndView viewUpdateFaq(
			ModelAndView mv
		  , @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result); // 기존 내용 띄우기
		mv.setViewName("admin/faq/update");
		return mv;
	}
	
	
	// 자주묻는질문 수정하기
	@PostMapping("/faq/update/{faqNo}") // 왜 url이 두개나오는거지??(faqupdate.jsp) 해결중!!!!!!!!!
	public ModelAndView selectFaqModify(
		     ModelAndView mv
		   , @PathVariable int faqNo
		   , AdminFaqVo vo) {
		service.selectFaqModify(vo);
		mv.setViewName("redirect:/admin/faq/detail/"+vo.getFaqNo());
		return mv;
	}
	
//	// 자주묻는질문 삭제하기
//	@GetMapping("/faq/delete/{faqNo}")
//	public ModelAndView deleteFaq(
//			  ModelAndView mv
//			, @PathVariable int faqNo
//			) {
//		service.deleteFaq(faqNo);
//		mv.setViewName("redirect:/admin/faq/list");
//		return mv;
//	}
	
	// 자주묻는질문 삭제하기 ajax
	@ResponseBody
	@GetMapping("/faq/delete")
	public String deleteFaq(
			  AdminFaqVo vo,
			  @RequestParam int faqNo
			) {
		service.deleteFaq(faqNo);
		return null;
	}
}

package kh.finalproject.sims.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminReviewMngtService;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

@RequestMapping("/admin")
@Controller
// 리뷰 목록
public class AdminReviewMngtController {
	@Autowired
	AdminReviewMngtService service;
	
	// 목록
	@RequestMapping(value = "review/list", method = {RequestMethod.GET,RequestMethod.POST })
	public ModelAndView selectReviewList(
			ModelAndView mv
			, AdminReviewMngtVo vo
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
  					cnt = "10";
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
		
		
		mv.setViewName("admin/review/list");
		return mv;
	}
	
	
	// 상세내용
	@GetMapping("review/detail/{reviewNo}")
	public ModelAndView selectReviewDetail(
			ModelAndView mv
			, @PathVariable int reviewNo
			) {
		AdminReviewMngtVo result = service.selectReviewDetail(reviewNo);
		mv.addObject("reviewdetail", result);
		mv.setViewName("admin/review/detail");
		return mv;
	}
	
	// 삭제
	@PostMapping("review/delete") 
	public String deleteReview(
			@RequestParam("reviewNo") int reviewNo
			) {
		service.deleteReview(reviewNo);
		return "redirect:/admin/review/detail/"+reviewNo;
	}
	
}

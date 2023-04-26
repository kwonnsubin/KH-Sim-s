package kh.finalproject.sims.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.finalproject.sims.admin.model.service.AdminReviewMngtService;
import kh.finalproject.sims.admin.model.service.AdminReviewReportMngtService;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;
import kh.finalproject.sims.common.page.Search;

@RequestMapping("/admin")
@Controller
// 신고 리뷰
public class AdminReviewReportMngtController {
	@Autowired
	AdminReviewReportMngtService service;
	
	// 목록
	@RequestMapping(value = "/reviewreport/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectReviewReportList(
			ModelAndView mv
			, AdminReviewMngtVo vo
			,@RequestParam(required = false) String keyword
			,@RequestParam(required = false) String searchType
			,@RequestParam(value = "p", required = false) String pageNumber
			, HttpServletRequest request
			, HttpServletResponse response	
			) {
		
		// 페이징
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
  		
		Search search = service.getPage(pNum, Integer.parseInt(cnt), keyword, searchType, vo.getReportStatus()); 
		request.setAttribute("paging", search);
		mv.addObject("reportStatus", vo.getReportStatus());
		mv.setViewName("admin/reviewreport/list");
		return mv;
	}
	
	// 상세
	@GetMapping("/reviewreport/detail/{reviewNo}")
	public ModelAndView selectReviewReportDetail(
			ModelAndView mv
			, @PathVariable int reviewNo
			) {
		AdminReviewMngtVo result = service.selectReviewReportDetail(reviewNo);
		mv.addObject("detail", result);
		mv.setViewName("admin/reviewreport/detail");
		return mv;
	}
	
	// 처리(반려/삭제)
	@PostMapping("/reviewreport/status")
	public String updateReviewReportStatus(
			@RequestParam("reviewNo") int reviewNo
			, @RequestParam("reviewHidden") int reviewHidden
			, @RequestParam("reportStatus") int reportStatus
			, AdminReviewMngtVo vo
			) {
		service.updateReviewReportStatus(vo);
		return "redirect:/admin/reviewreport/detail/"+reviewNo;
	}
	
	// ajax
	@ResponseBody
	@PostMapping("/getReviewReportList")
	public String getReviewReportList(
			@RequestParam("reviewNo") int reviewNo
			, @RequestParam("reviewHidden") int reviewHidden
			, @RequestParam("reportStatus") int reportStatus
			, AdminReviewMngtVo vo
			) {
		service.updateReviewReportStatus(vo);
		return "redirect:/admin/reviewreport/detail/"+reviewNo;
	}
}

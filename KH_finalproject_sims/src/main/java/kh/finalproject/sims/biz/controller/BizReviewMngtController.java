package kh.finalproject.sims.biz.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizReviewMngtService;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

@Controller
@RequestMapping("/biz")
public class BizReviewMngtController {

	@Autowired
	private BizReviewMngtService service;
	
	//자사 리뷰 리스트
	@GetMapping("reviewList")
	public ModelAndView selectBizReviewList(ModelAndView mv
			, HttpServletRequest request
			, HttpServletResponse response
			) {
		Principal principal =request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사 아이디 :"+bizid);
		
		String pageNumber = request.getParameter("p");
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

		Paging paging = service.getPage(bizid, pNum, Integer.parseInt(cnt));
		request.setAttribute("paging", paging);
		
		System.out.println("paging.getPage() : "+paging.getPage());
		System.out.println("getPageList : "+paging.getPageList());
		
		mv.setViewName("biz/reviewList");
		return mv;
	}
	
	//리뷰신고하기
	@PostMapping("/reportReview")
	@ResponseBody
	public String reportReview(
			@RequestParam("reviewNo") int reviewNo,
            @RequestParam("reportReason") String reportReason
			) {
		System.out.println("reviewNo: " + reviewNo);
        System.out.println("reportReason: " + reportReason);
        
        BizReviewMngtVo vo = new BizReviewMngtVo();
        vo.setReviewNo(reviewNo);
        vo.setReportReason(reportReason);
        
        service.reportReview(vo);
        return "success";
	}
	
	//리뷰신고 취소하기
	@PostMapping("/cancleReport")
	@ResponseBody
	public String cancleReport(@RequestParam("reviewNo") int reviewNo) {
		System.out.println("신고 취소하고자하는 리뷰번호 :"+reviewNo);
		
		service.cancleReport(reviewNo);		
		return "success";
	}
	

}

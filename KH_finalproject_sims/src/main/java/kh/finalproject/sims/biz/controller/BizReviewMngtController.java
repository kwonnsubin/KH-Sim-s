package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

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

import com.google.gson.Gson;

import kh.finalproject.sims.biz.model.service.BizPlanMngtService;
import kh.finalproject.sims.biz.model.service.BizReviewMngtService;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.biz.model.vo.BizReviewMngtVo;
import kh.finalproject.sims.common.page.Paging;

@Controller
@RequestMapping("/biz")
public class BizReviewMngtController {

	@Autowired
	private BizReviewMngtService service;
	
	@Autowired
	private BizPlanMngtService planService;

	
	//리뷰신고하기
	@PostMapping("/reportReview")
	@ResponseBody
	public String reportReview(
			@RequestParam("reviewNo") int reviewNo,
            @RequestParam("reportReason") String reportReason
			) throws Exception {
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
	public String cancleReport(@RequestParam("reviewNo") int reviewNo) throws Exception {
		System.out.println("신고 취소하고자하는 리뷰번호 :"+reviewNo);
		
		service.cancleReport(reviewNo);		
		return "success";
	}
	
	//리뷰상세보기
	@GetMapping("/reviewDetail")
	public ModelAndView reviewDetail(ModelAndView mv
			,@RequestParam("reviewNo") int reviewNo
			) throws Exception {
		
		BizReviewMngtVo vo = service.selectReviewDetail(reviewNo);
		System.out.println("리뷰 상세보기"+vo);
		
		mv.addObject("reviewDetail",vo);
		
		mv.setViewName("biz/reviewDetail");
		return mv;
	}
	

	@GetMapping("/reviewList")
	public ModelAndView selectByReportStatus(BizReviewMngtVo vo
			, Principal principal
			, HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(value = "p", required = false) String pageNumber
			, @RequestParam(required = false, defaultValue = "0") Integer reportStatus
			, ModelAndView mv) throws Exception {
		
		String bizid = principal.getName();
		System.out.println("통신사 아이디 :"+bizid);
		
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
		
		BizPlanMngtVo bizName = planService.findByBizName(bizid);
		System.out.println(bizName);
		mv.addObject("bizName", bizName);
		
		
		
		Paging paging = service.selectByReportStatus(bizid, pNum, Integer.parseInt(cnt),reportStatus);
		request.setAttribute("paging", paging);
		mv.addObject("reportStatus",reportStatus);
		
		System.out.println("paging.getPage() : "+paging.getPage());
		System.out.println("getPageList : "+paging.getPageList());
		
		int reviewCnt = service.selectByReportStatusCnt(bizid,reportStatus);
		System.out.println("해당 통신사 상태 리뷰 총 개수 : "+reviewCnt);
		
		mv.addObject("reviewCnt",reviewCnt);
		mv.setViewName("biz/reviewList");
		
		return mv; 
		}



}

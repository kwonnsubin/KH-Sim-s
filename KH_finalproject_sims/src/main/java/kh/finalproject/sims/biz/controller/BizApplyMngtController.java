package kh.finalproject.sims.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizApplyMngtService;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

@Controller
@RequestMapping("/biz")
public class BizApplyMngtController {

	@Autowired
	private BizApplyMngtService service;
	
	//search 가입신청 목록
	@GetMapping("/applyList")
	public ModelAndView selectBizPlanApplyList(ModelAndView mv
			, @RequestParam(required = false) String keyword
			, @RequestParam(required = false, defaultValue = "planName") String searchType
			, HttpServletRequest request
			, HttpServletResponse response
			) {
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		//페이징
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
		
		
		int searchApplyListCount = service.getSearchApplyListCount(bizid,searchType,keyword);
		System.out.println("검색 결과 가입신청 목록 개수는 : "+searchApplyListCount);
		
		Search search = service.getPage(bizid, pNum, Integer.parseInt(cnt),searchType,keyword );
	
		//Paging paging = service.getPage(bizid, pNum, Integer.parseInt(cnt));
		request.setAttribute("paging", search);
		
		System.out.println("@@@@search.getPage() : " +search.getPage());//확인용
		System.out.println("#########getPageList : "+ search.getPageList()); //하단 개수

		mv.addObject("applyListCnt",searchApplyListCount);
		mv.setViewName("biz/applyList");
		
		mv.addObject("searchType",searchType);
		mv.addObject("keyword", keyword);
		return mv;
	}
	
	//요금제 가입 신청서 상세 보기
	@GetMapping("/applydetail")
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv
			, int orderNo
			) {
		
		BizApplyVo vo = service.selectApplyDetailUser(orderNo);
		System.out.println(vo);
		BizApplyVo vo1 = service.selectApplyDetailPlan(orderNo);
		
		mv.addObject("applyDetail", vo);
		mv.addObject("applyDetailPlan", vo1);
		
		
		mv.setViewName("biz/applyDetail");
		return mv;
	}
	
	//가입신청상태 변경
	@PostMapping("/approveStatus")
	@ResponseBody
	public String approveStatus(int orderNo) {
		service.updateApproveStatus(orderNo);
		return "success";
	} 

	@PostMapping("/holdStatus")
	@ResponseBody
	public String holdStatus(int orderNo) {
		service.updateHoldStatus(orderNo);
		return "success";
	}
}

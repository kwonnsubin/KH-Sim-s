package kh.finalproject.sims.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import kh.finalproject.sims.biz.model.service.BizPlanMngtService;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;

@Controller
@RequestMapping("/biz")
public class BizApplyMngtController {

	@Autowired
	private BizApplyMngtService service;
	
	@Autowired
	private BizPlanMngtService planService;
	
	//날짜 조회 추가
	//search 가입신청 목록 + 분류
			@GetMapping("/applyList")
			public ModelAndView selectBizPlanApplyList(ModelAndView mv
					, Principal principal
					, @RequestParam(required = false) String keyword
					, @RequestParam(required = false, defaultValue = "planName") String searchType
					, @RequestParam(required = false, defaultValue = "0")Integer orderStatus //defaultValue를 설정해주어야 함.
					, @RequestParam(required = false) String startDate
					, @RequestParam(required = false) String endDate
					, HttpServletRequest request
					, HttpServletResponse response
					) {
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
				
			
		        
				
				// 전체조회(0)이어도 매퍼에서 처리	
			
					int divisionApplyListCountByDateRange = service.getDevisionApplyListCountByDateRange(bizid,searchType,keyword,orderStatus,startDate, endDate);
					System.out.println("검색 결과 가입신청 목록 개수는 : "+divisionApplyListCountByDateRange);
					
					Search search = service.getDevisionPageByDateRange(bizid, pNum, Integer.parseInt(cnt),searchType,keyword,orderStatus,startDate,endDate);
				
					request.setAttribute("paging", search);
					
					System.out.println("@@@@search.getPage() : " +search.getPage());//확인용
					System.out.println("#########getPageList : "+ search.getPageList()); //하단 개수
					
					BizPlanMngtVo bizName = planService.findByBizName(bizid);
					System.out.println(bizName);
					mv.addObject("bizName", bizName);

					mv.addObject("applyListCnt",divisionApplyListCountByDateRange);	
					mv.addObject("searchType",searchType);
					mv.addObject("keyword", keyword);
					mv.addObject("orderStatus", orderStatus);
					mv.addObject("startDate",startDate);
					mv.addObject("endDate",endDate);
					mv.setViewName("biz/applyList");
					
					return mv;
				
					
			}

//	//search 가입신청 목록 + 분류 
//		@GetMapping("/applyList")
//		public ModelAndView selectBizPlanApplyList(ModelAndView mv
//				, Principal principal
//				, @RequestParam(required = false) String keyword
//				, @RequestParam(required = false, defaultValue = "planName") String searchType
//				, @RequestParam(required = false, defaultValue = "0")Integer orderStatus //defaultValue를 설정해주어야 함. 
//				, HttpServletRequest request
//				, HttpServletResponse response
//				) {
//			String bizid = principal.getName();
//			System.out.println("통신사아이디 : "+bizid);
//			
//			//페이징
//			String pageNumber = request.getParameter("p");
//			int pNum;
//			if (pageNumber == null || pageNumber.isEmpty()) {
//				pNum = 1;
//			} else {
//				pNum = Integer.parseInt(pageNumber);
//			}
//		
//			Cookie cookie = null;
//			Cookie[] cookies = request.getCookies();
//			for (Cookie c : cookies) {
//				if (c.getName().equals("cnt")) {
//					cookie = c;
//				}
//			}
//		
//			String cnt = request.getParameter("cnt");
//			if (cnt != null) {
//				if (cnt.isEmpty()) {
//					if (cookie != null) {
//						cnt = cookie.getValue();
//					} else {
//						cnt = "10"; // 초기값
//					}
//				}
//			} else {
//				if (cookie != null) {
//					cnt = cookie.getValue();
//				} else {
//					cnt = "10";
//				}
//			}
//		
//			cookie = new Cookie("cnt", cnt);
//			cookie.setMaxAge(60 * 60 * 24 * 5);
//			response.addCookie(cookie);
//			
//			
//			// 분류 - 전체조회
//			if(orderStatus == 0) { 
//				int searchApplyListCount = service.getSearchApplyListCount(bizid,searchType,keyword);
//				System.out.println("검색 결과 가입신청 목록 개수는 : "+searchApplyListCount);
//				
//				Search search = service.getPage(bizid, pNum, Integer.parseInt(cnt),searchType,keyword );
//			
//				//Paging paging = service.getPage(bizid, pNum, Integer.parseInt(cnt));
//				request.setAttribute("paging", search);
//				
//				System.out.println("@@@@search.getPage() : " +search.getPage());//확인용
//				System.out.println("#########getPageList : "+ search.getPageList()); //하단 개수
//	
//				mv.addObject("applyListCnt",searchApplyListCount);
//				mv.setViewName("biz/applyList");
//				
//				mv.addObject("searchType",searchType);
//				mv.addObject("keyword", keyword);
//				
//				return mv;
//				
//			// 분류 - 신청완료, 승인완료, 승인보류	
//			} else {
//				int divisionApplyListCount = service.getDevisionApplyListCount(bizid,searchType,keyword,orderStatus);
//				System.out.println("검색 결과 가입신청 목록 개수는 : "+divisionApplyListCount);
//				
//				Search search = service.getDevisionPage(bizid, pNum, Integer.parseInt(cnt),searchType,keyword,orderStatus);
//			
//				//Paging paging = service.getPage(bizid, pNum, Integer.parseInt(cnt));
//				request.setAttribute("paging", search);
//				
//				System.out.println("@@@@search.getPage() : " +search.getPage());//확인용
//				System.out.println("#########getPageList : "+ search.getPageList()); //하단 개수
//
//				mv.addObject("applyListCnt",divisionApplyListCount);	
//				mv.addObject("searchType",searchType);
//				mv.addObject("keyword", keyword);
//				mv.addObject("orderStatus", orderStatus);
//				mv.setViewName("biz/applyList");
//				
//				System.out.println("%%%%%%%%라디오버튼 체크 값에 따른 목록 :"+search.getPage());
//				return mv;
//			}
//				
//		}
	
	//요금제 가입 신청서 상세 보기
	@GetMapping("/applydetail")
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv
			, int orderNo
			, Principal principal
			) {
		
		BizApplyVo vo = service.selectApplyDetailUser(orderNo);
		System.out.println(vo);
		BizApplyVo vo1 = service.selectApplyDetailPlan(orderNo);
		
		mv.addObject("applyDetail", vo);
		mv.addObject("applyDetailPlan", vo1);
		
		String bizid = principal.getName();
		BizPlanMngtVo bizName = planService.findByBizName(bizid);
		System.out.println(bizName);
		mv.addObject("bizName", bizName);
		
		
		mv.setViewName("biz/applyDetail");
		return mv;
	}
	
	//가입신청상태 변경
	@PostMapping("/approveStatus")
	@ResponseBody
	public String approveStatus(int orderNo
			, Principal principal) {
		
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		service.updateApproveStatus(orderNo,bizid);
		return "success";
	} 

	@PostMapping("/holdStatus")
	@ResponseBody
	public String holdStatus(int orderNo
			,Principal principal) {
		
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		service.updateHoldStatus(orderNo,bizid);
		return "success";
	}
	
}

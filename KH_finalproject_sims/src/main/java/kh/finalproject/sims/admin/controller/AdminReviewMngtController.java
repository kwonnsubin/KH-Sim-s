package kh.finalproject.sims.admin.controller;

import java.util.List;

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
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminReviewMngtVo;

@RequestMapping("/admin")
@Controller
public class AdminReviewMngtController {
	@Autowired
	AdminReviewMngtService service;
	
	// 신고 리뷰 목록
	@RequestMapping(value = "/reviewreport/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectReviewReportList(
			ModelAndView mv
			, AdminReviewMngtVo vo
			) {
		if(vo.getSearchOption() == null) {
			mv.addObject("reviewReportList", service.selectReviewReportList());		
		} else {
			mv.addObject("reviewReportList", service.selectSearchReviewReportList(vo)); // 검색이 있을경우
	        mv.addObject("searchOption", vo.getSearchOption());
	        mv.addObject("searchBox", vo.getSearchBox());
		}
		mv.setViewName("admin/reviewreport/list");
		return mv;
	}
	
	// 신고 리뷰 상세
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
	
	// 신고 리뷰 처리(반려/삭제)
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
	
	// 리뷰 목록
	@RequestMapping(value = "review/list", method = {RequestMethod.GET,RequestMethod.POST })
	public ModelAndView selectReviewList(
			ModelAndView mv
			, AdminReviewMngtVo vo
			) {
		if(vo.getSearchOption() == null) {
			mv.addObject("reviewlist", service.selectReviewList()); // 검색이 없는경우			
		} else {
			mv.addObject("reviewlist", service.selectSearchReviewList(vo)); // 검색이 있을경우
	        mv.addObject("searchOption", vo.getSearchOption());
	        mv.addObject("searchBox", vo.getSearchBox());
		}
		mv.setViewName("admin/review/list");
		return mv;
	}
	
	
	// 리뷰 상세 내용
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
	
	// 리뷰 삭제
	@PostMapping("review/delete") 
	public String deleteReview(
			@RequestParam("reviewNo") int reviewNo
			) {
		service.deleteReview(reviewNo);
		return "redirect:/admin/review/detail/"+reviewNo;
	}
	


}

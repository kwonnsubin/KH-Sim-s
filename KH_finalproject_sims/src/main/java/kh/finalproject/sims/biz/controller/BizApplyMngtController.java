package kh.finalproject.sims.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

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

@Controller
@RequestMapping("/biz")
public class BizApplyMngtController {

	@Autowired
	private BizApplyMngtService service;
	
	//요금제 가입 신청 리스트
	@GetMapping("/applyList")
	public ModelAndView selectBizPlanApplyList(ModelAndView mv
			, HttpServletRequest request
			) {
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		List<BizApplyVo> applyList = service.selectBizPlanApplyList(bizid);
		System.out.println(applyList);
		
		
		
		mv.addObject("applyList",applyList);
		mv.setViewName("biz/applyList");
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

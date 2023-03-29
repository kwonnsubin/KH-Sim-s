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
		//TODO 그 해당 통신사에게 들어온 가입 신청서..
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		//TODO userName 가져와야 함. 혹은 리스트에선 아이디, 상세 정보에선 실명까지?
		//TODO 신청상태 jsp 조건 걸 것
		List<BizApplyVo> applyList = service.selectBizPlanApplyList(bizid);
		System.out.println(applyList);
		
		mv.addObject("applyList",applyList);
		mv.setViewName("biz/applyList");
		return mv;
	}
	
	//요금제 가입 신청서 상세 보기
	@GetMapping("/applydetail")
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv) {
		//TODO 그 사용자 아이디 매개인자로 들고 가야되는데..가 아니라 orderNo 가져가야되지 않나?
		BizApplyVo vo = service.selectApplyDetailUser();
		System.out.println(vo);
		BizApplyVo vo1 = service.selectApplyDetailPlan();
		
		mv.addObject("applyDetail", vo);
		mv.addObject("applyDetailPlan", vo1);
		
		
		mv.setViewName("biz/applyDetail");
		return mv;
	}
	
	//가입신청상태 변경
	@PostMapping("/approveStatus")
	@ResponseBody
	public String approveStatus() {
		service.updateApproveStatus();
		return "success";
	} 

	@PostMapping("/holdStatus")
	@ResponseBody
	public String holdStatus() {
		service.updateHoldStatus();
		return "success";
	}
}

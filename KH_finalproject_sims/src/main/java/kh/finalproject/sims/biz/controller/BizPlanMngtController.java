package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizPlanMngtService;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;

@Controller
@RequestMapping("/biz")
public class BizPlanMngtController {

	@Autowired
	private BizPlanMngtService service;
	
	// 자사 요금제 목록
	@GetMapping("/planList")
	public ModelAndView selectBizPlanList(ModelAndView mv
			, HttpServletRequest request
			) {
		
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		List<BizPlanMngtVo> planList = service.selectBizPlanList(bizid);
		System.out.println(planList);
		
		mv.addObject("planList", planList);
		
		mv.setViewName("/biz/planList");
		return mv;
	}
	
	//통신사 요금제 상세
	@GetMapping("/planDetail")
	public ModelAndView selectBizPlanDetail(ModelAndView mv) {
	//TODO	
		
		mv.setViewName("/biz/planDetail");
		return mv;
	}

	
	
	//통신사 요금제 등록
	@GetMapping("/registerPlan") //왜 GET??
	public ModelAndView registerBizPlan(ModelAndView mv) {
		//TODO	
		
		mv.setViewName("/biz/registerPlan");
		return mv;
	}

}

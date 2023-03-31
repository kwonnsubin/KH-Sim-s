package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		int listCnt = service.getPlanListCnt(bizid);
		System.out.println("요금제 목록 개수는 : "+listCnt);
		BizPlanMngtVo vo = new BizPlanMngtVo();
		vo.setListCnt(listCnt);
		System.out.println("listCnt를 저장한 vo : "+vo);
		
		mv.addObject("vo", vo);
		mv.addObject("planList", planList);
		
		mv.setViewName("/biz/planList");
		return mv;
	}
	
	//통신사 요금제 상세
	@GetMapping("/planDetail")
	public ModelAndView selectBizPlanDetail(ModelAndView mv
			, int planNo
			) {
		System.out.println(planNo);
		BizPlanMngtVo vo = service.selectBizPlanDetail(planNo); // 이름으로 보내면 요금제 이름이 중복 될 경우에 에러 나서 planNo로
		System.out.println(vo);
		
		mv.addObject("planDetail", vo);
		mv.setViewName("/biz/planDetail");
		return mv;
	}

	
	
	//통신사 요금제 등록
	@GetMapping("/registerPlan") 
	public ModelAndView registerBizPlan(ModelAndView mv
			, HttpServletRequest request
			) {
		
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		BizPlanMngtVo vo = service.findByBizName(bizid);
		System.out.println(vo);
		
		
		mv.addObject("vo",vo);
		mv.setViewName("/biz/registerPlan");
		return mv;
	}
	
	
	@PostMapping("/registerPlan") 
	public String registerBizPlan(ModelAndView mv
			, @ModelAttribute BizPlanMngtVo vo
			) {
	    service.registerBizPlan(vo);
	    
		return "redirect:/biz/planList";
	}

}

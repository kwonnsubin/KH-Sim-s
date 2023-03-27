package kh.finalproject.sims.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizApplyMngtService;
import kh.finalproject.sims.biz.model.vo.BizApplyVo;

@Controller
@RequestMapping("/biz")
public class BizApplyMngtController {

	@Autowired
	private BizApplyMngtService service;
	
	@GetMapping("/applydetail")
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv) {
		
		BizApplyVo vo = service.selectApplyDetailUser();
		System.out.println(vo);
		BizApplyVo vo1 = service.selectApplyDetailPlan();
		
		mv.addObject("applyDetail", vo);
		mv.addObject("applyDetailPlan", vo1);
		
		
		mv.setViewName("biz/applyDetail");
		return mv;
	}
	
	//가입신청상태 변경
	//public String appove
	//TODO 에이작스 값 받아오기
}

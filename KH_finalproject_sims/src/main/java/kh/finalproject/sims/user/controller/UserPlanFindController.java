package kh.finalproject.sims.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.service.UserPlanFindService;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Controller
public class UserPlanFindController {
	
	@Autowired
	private UserPlanFindService service;
	
	@GetMapping("/plans")
	public ModelAndView plan(ModelAndView mv
			, PlanVo pvo
			) {
		System.out.println(pvo.toString());
		if(pvo.getPlanData() == 0) {
			List<PlanVo> planList = service.selectPlanList();
			int cnt = service.cntPlanList();
			mv.addObject("planList", planList);
			mv.addObject("cnt", cnt);
		} else {
			System.out.println(pvo.getPlanData());
			System.out.println(pvo.getPlanVoice());
			System.out.println(pvo.getPlanMessage());
			System.out.println(pvo.getPlanPrice());
			System.out.println(pvo.getNetNo());
			System.out.println(pvo.getGenNo());
			System.out.println(pvo.getBizName());
			List<PlanVo> planList = service.selectPlanList(pvo);
			mv.addObject("planList", planList);
		}
		
		List<BizInfoMngtVo> bizList = service.selectBizNameList();
		
		mv.addObject("bizList", bizList);
		mv.setViewName("user/plan/plans");
		
		return mv;
	}

}

package kh.finalproject.sims.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminStatisticsService;
import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;

@Controller
@RequestMapping("/admin")
public class AdminStatisticsController {
	@Autowired
	AdminStatisticsService service;
	
	@GetMapping("/statistics")
	public ModelAndView selectOrderByRegistration(
			ModelAndView mv
			) {
		mv.addObject("orderByRegistration", service.selectOrderByRegistration()); // 가입자 많은 순
		mv.addObject("ageGroupPlans",service.selectAgeGroupPlans()); // 연령대별 요금제 
		mv.addObject("starRating", service.selectStarRating()); // 별점순 통신사
		mv.addObject("monthlyPlanOrderCount", service.selectMonthlyPlanOrderCount()); // 월별 총 가입자 수
		mv.addObject("ageGroupPlanOrderCount", service.selectAgeGroupPlanOrderCount()); // 연령대별 총 가입자 수 
		mv.addObject("dailyTotalUserWriteCount", service.selectDailyTotalUserWriteCount()); // 일별 총 가입자 수 변화
		mv.addObject("dailyGenderUserWriteCount", service.selectDailyGenderUserWriteCount()); // 일별 성별 가입자 수 변화
		mv.addObject("genderRatioByTotalUserRatio", service.selectGenderRatioByTotalUserRatio()); // 성별 가입자 수 비율
		mv.addObject("ageGroupByTotalUserRatio", service.selectAgeGroupByTotalUserRatio()); // 연령대 가입자 수 비율
		mv.setViewName("/admin/statistics");
		return mv;
		
	}
}

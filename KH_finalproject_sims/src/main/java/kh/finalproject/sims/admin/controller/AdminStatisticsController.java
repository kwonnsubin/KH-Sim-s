package kh.finalproject.sims.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.finalproject.sims.admin.model.service.AdminStatisticsService;
import kh.finalproject.sims.admin.model.vo.AdminStatisticsVo;
import kh.finalproject.sims.biz.model.vo.BizChartVo;

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
		mv.setViewName("/admin/statistics");
		return mv;
	}
	
	// 일별 총 가입자 수
	@ResponseBody
	@PostMapping("/dailyTotalUserWriteCount")
	public String selectDailyTotalUserWriteCount(
			) {
		List<AdminStatisticsVo> chartList = service.selectDailyTotalUserWriteCount(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
	
	// 월별 총 가입자 수
	@ResponseBody
	@PostMapping("/monthlyPlanOrderCount")
	public String selectMonthlyPlanOrderCount(
			) {
		List<AdminStatisticsVo> chartList = service.selectMonthlyPlanOrderCount(); // 차트 리스트
		return new Gson().toJson(chartList);	
	}
	
	// 일별 성별 가입자 수 
	@ResponseBody
	@PostMapping("/dailyGenderUserWriteCount")
	public String selectDailyGenderUserWriteCount(
			) {
		List<AdminStatisticsVo> chartList = service.selectDailyGenderUserWriteCount(); // 차트 리스트
		return new Gson().toJson(chartList);	
	}
	
	// 일별 성별 가입자 수 
	@ResponseBody
	@PostMapping("/genderRatioByTotalUserRatio")
	public String selectGenderRatioByTotalUserRatio(
			) {
		AdminStatisticsVo chartList = service.selectGenderRatioByTotalUserRatio(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
	
	// 연령별 총 가입자 수  
	@ResponseBody
	@PostMapping("/ageGroupPlanOrderCount")
	public String selectAgeGroupPlanOrderCount(
			) {
		List<AdminStatisticsVo> chartList = service.selectAgeGroupPlanOrderCount(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
	
	// 연령별 가입자 수 비율 
	@ResponseBody
	@PostMapping("/ageGroupByTotalUserRatio")
	public String selectAgeGroupByTotalUserRatio(
			) {
		List<AdminStatisticsVo> chartList = service.selectAgeGroupByTotalUserRatio(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
	
	// 별점순 통신사 
	@ResponseBody
	@PostMapping("/starRating")
	public String selectStarRating(
			) {
		List<AdminStatisticsVo> chartList = service.selectStarRating(); // 차트 리스트
		return new Gson().toJson(chartList);
	}
	
	
}



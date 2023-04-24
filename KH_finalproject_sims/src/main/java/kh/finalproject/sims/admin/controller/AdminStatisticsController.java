package kh.finalproject.sims.admin.controller;


import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
	
	// 일별 총 가입자수 변화
	@ResponseBody
	@PostMapping("/dailyTotalUserWriteCount")
	public String selectDailyTotalUserWriteCount(
			) {
		List<AdminStatisticsVo> chartList = service.selectDailyTotalUserWriteCount(); // 차트 리스트
		
		//List<AdminStatisticsVo> dataList = new ArrayList<>();
		return new Gson().toJson(chartList);
		
	}

}



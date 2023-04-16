package kh.finalproject.sims.biz.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

import kh.finalproject.sims.biz.model.service.BizMainService;
import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMainVo;

@Controller
@RequestMapping("/biz")
public class BizMainController {
	
	@Autowired
	private BizMainService service;
	
	//통신사 마이페이지 메인
	@GetMapping("/main")
	public ModelAndView showMainBoard(ModelAndView mv
			, Principal principal
			) throws JsonIOException, IOException {
		
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		//TODO 통신사 로고이미지 가지고 오기
		//service.findByBizLogo(bizid);
		
		System.out.println("!@!@!@!@!@!selectJoinPlanByDate : "+service.selectJoinPlanByDate(bizid));

		//가장 인기 있는 요금제명
		String selectTopPlanName = service.selectTopPlanName(bizid);
		System.out.println("현재 가장 인기있는 요금제명 :"+selectTopPlanName);
		
		mv.addObject("selectTopPlanName",selectTopPlanName);
		
		mv.setViewName("/biz/main");
		return mv;
	}

	
	//최근 일주일간 해당 통신사 요금제 가입자 열 그래프
	@PostMapping("/main")
	@ResponseBody
	public String chart(Model model
			, Principal principal
			, HttpServletResponse response
			) {
		
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		List<BizChartVo>charList = service.selectJoinPlanByDate(bizid);
		System.out.println(charList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		DateFormat df = new SimpleDateFormat("yy-MM-dd");
		
		Iterator<BizChartVo> it =charList.iterator();
		while(it.hasNext()) {
			BizChartVo bizchartVo = it.next();
			JsonObject object = new JsonObject();
			int orderCnt = bizchartVo.getOrderCnt();
			
			Date dt = bizchartVo.getOrderDate();
			String date = df.format(dt);
			
			object.addProperty("orderCnt", orderCnt);
			object.addProperty("date", date);
			jArray.add(object);
		}
		String json = gson.toJson(jArray);
		System.out.println(("json변환"+json));

		
		return json;	
	}
	
	
	//자사 요금제별 총 누적 가입자 수+오늘자 가입자 수
	 @PostMapping("/planAcc.Aj")
	 @ResponseBody 
	 public String chart2(Principal principal 
			) throws JsonProcessingException {
	 
	 String bizid = principal.getName(); 
	 System.out.println("통신사아이디 : "+bizid);
	  
	 List<BizMainVo> totalList = service.selectTotalApplyByPlan(bizid);
	 System.out.println("totalList :"+totalList);
	 
	 List<BizMainVo> todayList = service.selectTodayApplyByPlan(bizid);
	 System.out.println("todayList :"+todayList);
	 
	// 결과를 저장할 리스트 생성
	 List<Map<String, Object>> dataList = new ArrayList<>();

	 // totalList와 todayList를 합쳐서 dataList에 저장
	 for (BizMainVo vo : totalList) {
	     Map<String, Object> data = new HashMap<>();
	     data.put("planName", vo.getPlanName());
	     data.put("planApplyCnt", vo.getPlanApplyCnt());

	     int todayApplyCnt = 0;
	     for (BizMainVo todayVo : todayList) {
	    	 if (vo.getPlanNo() == todayVo.getPlanNo()) {
	             todayApplyCnt = todayVo.getTodayPlanApplyCnt();
	             break;
	         }
	     }
	     data.put("todayApplyCnt", todayApplyCnt);

	     dataList.add(data);
	 }

	 // dataList를 JSON으로 변환하여 반환
	 return new Gson().toJson(dataList);
	 }

	 //가장 인기있는 요금제의 연령대 비율
	 @PostMapping("/piechart")
	 @ResponseBody
	 public String piechart(Principal principal) {
		 String bizid = principal.getName(); 

		 List<BizMainVo> topPlanAgeGroupList = service.selectTopPlanAgeRatio(bizid);
		 System.out.println("topPlanAgeGroupList : "+topPlanAgeGroupList);
		 
		 JSONArray jsonArray = new JSONArray();
		 for(BizMainVo vo : topPlanAgeGroupList) {
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("ageGroup", vo.getAgeGroup());
			 jsonObject.put("ageCnt", vo.getAgeCnt());
			 jsonArray.put(jsonObject);
		 }
		 System.out.println("jsonArray : "+jsonArray);
		 
		 return jsonArray.toString();
	 }
	 
	 //가장 인기있는 요금제의 성별 비율
	 @PostMapping("/piechart2.Aj")
	 @ResponseBody
	 public String piechart2(Principal pricipal) {
		 String bizid = pricipal.getName();
		 
		 List<BizMainVo> topPlanGgenderList = service.selectTopPlanGenderRatio(bizid);
		 System.out.println("topPlanGgenderList : "+ topPlanGgenderList);
		 
		 JSONArray jsonArray = new JSONArray();
		 for(BizMainVo vo : topPlanGgenderList) {
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("gender", vo.getGender());
			 jsonObject.put("genderCnt", vo.getGenderCnt());
			 jsonArray.put(jsonObject);
		 }
		 System.out.println("jsonArray : "+jsonArray);
		 
		 return jsonArray.toString();
	 }
	 
	 //통신사 전체 이용 연령대 비율
	 @PostMapping("/bizAgeRatio.Aj")
	 @ResponseBody
	 public String bizAgeRatio(Principal pricipal) {
		 String bizid = pricipal.getName();
		 
		 List<BizMainVo> bizAgeList = service.selectBizAgeRatio(bizid);
		 System.out.println("bizAgeList : "+ bizAgeList);
		 
		 JSONArray jsonArray = new JSONArray();
		 for(BizMainVo vo : bizAgeList) {
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("ageGroup", vo.getAgeGroup());
			 jsonObject.put("ageCnt", vo.getAgeCnt());
			 jsonArray.put(jsonObject);
		 }
		 System.out.println("jsonArray : "+jsonArray);
		 
		 return jsonArray.toString();
	 }
	 
	 //통신사 전체 이용 성별 비율
	 @PostMapping("/bizGenderRatio.Aj")
	 @ResponseBody
	 public String bizGenderRatio(Principal pricipal) {
		 String bizid = pricipal.getName();
		 
		 List<BizMainVo> bizGenderList = service.selectBizGenderRatio(bizid);
		 System.out.println("bizGenderList : "+ bizGenderList);
		 
		 JSONArray jsonArray = new JSONArray();
		 for(BizMainVo vo : bizGenderList) {
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("gender", vo.getGender());
			 jsonObject.put("genderCnt", vo.getGenderCnt());
			 jsonArray.put(jsonObject);
		 }
		 System.out.println("@@@@@@@@@@@@전체 이용 성별 비율 jsonArray : "+jsonArray);
		 
		 return jsonArray.toString();
	 }
}

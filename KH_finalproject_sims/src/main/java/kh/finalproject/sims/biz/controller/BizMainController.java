package kh.finalproject.sims.biz.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
	
	
	//자사 요금제별 총 가입자 수
	 @PostMapping("/test")
	 @ResponseBody 
	 public String chart2(Principal principal 
			) throws JsonProcessingException {
	 
	 String bizid = principal.getName(); 
	 System.out.println("통신사아이디 : "+bizid);
	  
	 List<BizMainVo> totalList = service.selectTotalApplyByPlan(bizid);
	 System.out.println("totalList :"+totalList);
	 
//	 ObjectMapper objectMapper = new ObjectMapper();
//	 String json = objectMapper.writeValueAsString(totalList);
	 
	 JSONArray jsonArray = new JSONArray();
	 
	 for(BizMainVo vo : totalList) {
		 JSONObject jsonObject = new JSONObject();
		 jsonObject.put("planName", vo.getPlanName());
		 jsonObject.put("planApplyCnt", vo.getPlanApplyCnt());
		 jsonArray.put(jsonObject);
	 }
	 
	 System.out.println("jsonArray : "+jsonArray);
	  return jsonArray.toString(); 

	 }

	 //가장 인기있는 요금제의 연령대 비율
	 @PostMapping("/piechart")
	 @ResponseBody
	 public String piechart(Principal principal) {
		 String bizid = principal.getName(); 

		 List<BizMainVo> ageGroupList = service.selectTopPlanAgeRatio(bizid);
		 System.out.println("ageGroupList : "+ageGroupList);
		 
		 JSONArray jsonArray = new JSONArray();
		 for(BizMainVo vo : ageGroupList) {
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("ageGroup", vo.getAgeGroup());
			 jsonObject.put("ageCnt", vo.getAgeCnt());
			 jsonArray.put(jsonObject);
		 }
		 System.out.println("jsonArray : "+jsonArray);
		 
		 return jsonArray.toString();
	 }
	 
}

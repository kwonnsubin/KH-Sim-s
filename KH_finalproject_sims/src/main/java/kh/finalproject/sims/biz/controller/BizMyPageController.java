package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizMainService;
import kh.finalproject.sims.biz.model.service.BizMyPageService;
import kh.finalproject.sims.biz.model.vo.BizChartVo;
import kh.finalproject.sims.biz.model.vo.BizMyPageVo;

@Controller
@RequestMapping("/biz")
public class BizMyPageController {

	
	@Autowired
	private BizMyPageService service;
	
	@Autowired
	private BizMainService chartService;
	
	//마이페이지 텍스트 통계
		 @GetMapping("/myPage")
		 public ModelAndView myPage(ModelAndView mv
				 , Principal principal) {
			 
		     String bizid = principal.getName();
			 System.out.println("통신사아이디 : " + bizid);
			 
			 mv.addObject("todayReviewCnt",service.getTodayReviewCnt(bizid));
			 mv.addObject("totalReviewCnt",service.getTotalReviewCnt(bizid));
			 mv.addObject("todayApplyCnt",service.getTodayApplyCnt(bizid));
			 mv.addObject("totalApplyCnt",service.getTotalApplyCnt(bizid));
			 mv.addObject("totalPlanCnt",service.getTotalPlanCnt(bizid));
			 
			 
			 
			 BizMyPageVo vo = service.getLogo(bizid);
			 System.out.println("로고 : "+vo);

			 
			 String imagePath;
			 if (vo == null) {
			   // vo가 null인 경우 대체 이미지 경로 또는 링크
			   imagePath = "/resources/img/default_logo.png"; // 경로를 사용하는 경우 , jsp에서 onerror로 처리함. 
			   // imagePath = "https://www.dummyimage.com/600x400/000/fff.jpg&text=Please+register+your+logo"; // 링크를 사용하는 경우
			 } else if (vo.getLogoRenameFilename() == null) {
			   imagePath = "/resources/img/" + vo.getOriginalFilename();
			 } else {
			   imagePath = "/resources/img/" + vo.getLogoRenameFilename();
			 }
			 mv.addObject("imagePath", imagePath);
			 System.out.println("imagePath :"+imagePath);

			 //최근리뷰
			 mv.addObject("recentReview",service.getRecentReview(bizid));
			 System.out.println("getRecentReview(bizid) : "+service.getRecentReview(bizid));
			 
			 //top 5 요금제 정보
			 mv.addObject("topPlanList",service.getTopFivePlanInfo(bizid));
			 System.out.println("topPlanList : "+service.getTopFivePlanInfo(bizid));
			 
			 mv.setViewName("/biz/myPage");
			 return mv;
		 }
		 
		 //최근 일주일간 해당 통신사 요금제 가입자
		 @PostMapping("/chart.aj")
		 @ResponseBody
		 public String chart(Principal principal
				 , JSONArray jsonArray
				 ) {
			 String bizid = principal.getName();
			 System.out.println("통신사 아이디 :"+bizid);
			 
			 List<BizChartVo> chartList = chartService.selectJoinPlanByDate(bizid);
			 System.out.println("최근 일주일간 통신사 요금제 가입자 수 chartList :"+chartList);
			 
			 DateFormat df = new SimpleDateFormat("yy-MM-dd");
			 for(BizChartVo vo : chartList) {
				 Date dt = vo.getOrderDate();
				 String date = df.format(dt);
				 
				 JSONObject jsonObject = new JSONObject();
				 jsonObject.put("orderDate", date);
				 jsonObject.put("orderCnt", vo.getOrderCnt());
				 jsonArray.put(jsonObject);
			 }
			 
			 System.out.println("jsonArray : "+jsonArray);
			 
			 return jsonArray.toString();
		 }
}

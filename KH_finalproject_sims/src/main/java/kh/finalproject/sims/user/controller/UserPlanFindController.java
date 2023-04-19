package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.biz.model.vo.BizApplyVo;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.user.model.service.UserMyPageService;
import kh.finalproject.sims.user.model.service.UserPlanFindService;
import kh.finalproject.sims.user.model.vo.CustomQueVo;
import kh.finalproject.sims.user.model.vo.PlanVo;

@Controller
public class UserPlanFindController {
	
	@Autowired
	private UserPlanFindService planFindService;
	
	@Autowired
	private UserMyPageService myPageService;
	
	@GetMapping("/plans")
	public ModelAndView selectPlanList(ModelAndView mv
			, PlanVo pvo
			, String searchText
			, HttpServletRequest req
			) {
		
		List<PlanVo> planList = null;
		int cnt = 0;
		
		if(pvo.getPlanData() == 0) {
			planList = planFindService.selectPlanList(searchText);
			cnt = planFindService.cntPlanList(searchText);
		} else {
			Map<String, Object> searchMap = new HashMap<String, Object>();
			
			searchMap.put("planData", pvo.getPlanData());
			searchMap.put("planVoice", pvo.getPlanVoice());
			searchMap.put("planMessage", pvo.getPlanMessage());
			searchMap.put("planPrice", pvo.getPlanPrice());
			searchMap.put("netNo", pvo.getNetNo());
			searchMap.put("genNo", pvo.getGenNo());
			searchMap.put("bizName", pvo.getBizName());
			searchMap.put("searchText", searchText);
			
			planList = planFindService.selectPlanList(searchMap);
			cnt = planFindService.cntPlanList(searchMap);
		}
		
		List<BizInfoMngtVo> bizList = planFindService.selectBizNameList();
		
		if(req.getUserPrincipal() != null) {
			Principal prin = req.getUserPrincipal();
			String userId = prin.getName();
			List<PlanVo> recentList = myPageService.selectRecentList(userId);
			mv.addObject("recentList", recentList);
		}
		
		mv.addObject("cnt", cnt);
		mv.addObject("planList", planList);
		mv.addObject("bizList", bizList);
		mv.setViewName("user/plan/plans");
		
		return mv;
	}
	
	@GetMapping("/planfind")
	public ModelAndView selectCustomFind(ModelAndView mv, Principal prin, String queType) {
		String userId = prin.getName();
		
		if(queType.equals("telecom")) {
			if(planFindService.selectUser(userId) == 0) {
				planFindService.insertUser(userId);
			}
		}
		
		CustomQueVo queVo = planFindService.selectCustomQueList(userId);
		mv.addObject("queVo", queVo);
		
		mv.setViewName("user/plan/planfind");
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/planfind")
	public String insertQueVal(ModelAndView mv, Principal prin, String type, int value) {
		String userId = prin.getName();
		
		Map<String, Object> val = new HashMap<>();
		val.put("type", type);
		val.put("value", value);
		
		planFindService.insertQueVal(val);
		CustomQueVo result = planFindService.selectCustomQueList(userId);
		
		return new Gson().toJson(result);
	}

}

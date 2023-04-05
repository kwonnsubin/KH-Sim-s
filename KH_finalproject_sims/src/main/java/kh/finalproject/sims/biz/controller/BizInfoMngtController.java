package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;

@Controller
@RequestMapping("/biz")
public class BizInfoMngtController {
	
	@Autowired
	private BizInfoMngtService service;
	


	//내 정보관리 상세
	@GetMapping("/infodetail")
	public ModelAndView selectBizInfoDetail(ModelAndView mv
			, HttpServletRequest request
			) {
		Principal principal = request.getUserPrincipal();
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		BizInfoMngtVo vo =service.selectBizInfoDetail(bizid);
		System.out.println(vo);
		
		//고객센터 번호
		List<bizInfoMngServiceVo> serviceList = service.selectListService(bizid);
		System.out.println(serviceList);
	
	
		mv.addObject("bizinfo", vo);
		mv.addObject("serviceList",serviceList);
		
		String imagePath ="/resources/img/"+vo.getLogoRenameFilename();
		mv.addObject("imagePath",imagePath);
		mv.setViewName("biz/bizInfo");
		return mv;
	}
	
	
	@GetMapping("/modifyInfo")
	public ModelAndView modifyBizInfo(ModelAndView mv
			) {

		
		
		mv.setViewName("biz/bizInfoModify");
		return mv;
	}


	
	//내 정보 수정하기
	//TODO
	@PostMapping("/modifyInfo")
	public String modifyBizInfo(
			HttpServletRequest request
			, @RequestParam(name = "weekday", required = false) String[] selectedWeekdays
			, @RequestParam(name="net", required = false) String[] selectedNetworks
			, @RequestParam("bizOwnerName") String bizOwnerName
			) {

		/* 이것도 되고
		 * if (selectedWeekdays != null) { for (String weekday : selectedWeekdays) {
		 * System.out.println("Selected weekday: " + weekday); } } else {
		 * System.out.println("No weekday selected"); }
		 */
		StringBuilder selectedWeekdaysString = new StringBuilder();
		if (selectedWeekdays != null) {
		    for (String weekday : selectedWeekdays) {
		        selectedWeekdaysString.append(weekday).append(",");
		    }
		    // 마지막 구분자 제거
		    selectedWeekdaysString.setLength(selectedWeekdaysString.length() - 1);
		} else {
		    selectedWeekdaysString.append("No weekday selected");
		}

		System.out.println("Selected weekdays: " + selectedWeekdaysString.toString());


		
		/////이건 되고..
		/*
		 * if (selectedNetworks != null) { for (String network : selectedNetworks) {
		 * System.out.println("Selected network: " + network); } } else {
		 * System.out.println("No network selected"); }
		 */
		
		//통신망
		StringBuilder selectedNetworksString = new StringBuilder();
		if (selectedNetworks != null) {
		    for (String network : selectedNetworks) {
		        selectedNetworksString.append(network).append(",");
		    }
		    // 마지막 구분자 제거
		    selectedNetworksString.setLength(selectedNetworksString.length() - 1);
		} else {
		    selectedNetworksString.append("No network selected");
		}

		String networkts = selectedNetworksString.toString();
		System.out.println(networkts);



		return "redirect:/biz/infodetail";
		
	}
}

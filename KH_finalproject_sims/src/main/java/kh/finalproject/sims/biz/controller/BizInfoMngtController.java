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
	
	//내 정보 수정하기 - 기본값 출력용
	@GetMapping("/modifyInfo")
	public ModelAndView modifyBizInfo(ModelAndView mv
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
		
		
		mv.setViewName("biz/bizInfoModify");
		return mv;
	}


	
	//내 정보 수정하기
	//TODO
	@PostMapping("/modifyInfo")
	public String modifyBizInfo(HttpServletRequest request
			, BizInfoMngtVo vo
			, bizInfoMngServiceVo svo
			, @RequestParam(name ="bizName") String bizName
			, @RequestParam(name ="bizOwnerName") String bizOwnerName
			, @RequestParam(name ="bizCrn") String bizCrn
			, @RequestParam(name ="bizSsn") String bizSsn
			//주소
			, @RequestParam(name ="bizZipCode") int bizZipCode
			, @RequestParam(name ="roadAddress") String roadAddress
			, @RequestParam(name ="detailAddress") String detailAddress
			// 
			, @RequestParam(name ="bizPhone") String bizPhone
			, @RequestParam(name ="bizFax") String bizFax
			, @RequestParam(name ="bizEmail") String bizEmail
			, @RequestParam(name ="bizHp") String bizHp
			
			, @RequestParam(name ="phoneOpTime") String phoneOpTime
			, @RequestParam(name ="phoneOpTimeUsim") String phoneOpTimeUsim
			, @RequestParam(name ="bizBeginTime") String bizBeginTime
			, @RequestParam(name ="bizEndTime") String bizEndTime
			//고객센터번호
			, @RequestParam(name ="KtService") String KtService
			, @RequestParam(name ="SktService") String SktService
			, @RequestParam(name ="LguService") String LguService
			
			, @RequestParam(name = "weekday", required = false) String[] selectedWeekdays
			, @RequestParam(name="net", required = false) String[] selectedNetworks
			
			//파일 첨부도 가져와야 하는는데.. 
			) {

		//휴무일
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

		String bizClosedDay = selectedWeekdaysString.toString();
		System.out.println("Selected weekdays: " + bizClosedDay);

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

		String network = selectedNetworksString.toString();
		System.out.println(network);

		
		


		return "redirect:/biz/infodetail";
		
	}
}

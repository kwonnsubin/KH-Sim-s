package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;
import kh.finalproject.sims.common.file.FileUtil;

@Controller
@RequestMapping("/biz")
public class BizInfoMngtController {
	
	@Autowired
	private BizInfoMngtService service;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	//내 정보관리 상세
	@GetMapping("/infodetail")
	public ModelAndView selectBizInfoDetail(ModelAndView mv
			, Principal principal
			) {
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
			, Principal principal
			) {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		BizInfoMngtVo vo =service.selectBizInfoDetail(bizid);
		System.out.println(vo);
		
		
		
		//고객센터 번호
		List<bizInfoMngServiceVo> serviceList = service.selectListService(bizid);
		System.out.println(serviceList);
		//
		for (bizInfoMngServiceVo service : serviceList) {
		    int netNo = service.getNetNo();
		    String bizNetService = service.getBizNetService();
		    System.out.println(netNo);
		    System.out.println(bizNetService);

		}
		
	
		mv.addObject("bizinfo", vo);
		mv.addObject("serviceList",serviceList);
		
		
		mv.setViewName("biz/bizInfoModify");
		return mv;
	}


	
	//내 정보 수정하기
	//TODO 요금제 테이블의 bizName도 같이 바꿔야 함. 
	@PostMapping("/modifyInfo")
	public String modifyBizInfo(HttpServletRequest request
			, Principal principal
			, @ModelAttribute BizInfoMngtVo vo
			, bizInfoMngServiceVo svo
			, @RequestParam(name ="bizName" , required = false) String bizName
//			, @RequestParam(name ="bizOwnerName" , required = false) String bizOwnerName
//			, @RequestParam(name ="bizCrn" , required = false) String bizCrn
//			, @RequestParam(name ="bizSsn" , required = false) String bizSsn
//			//주소
//			, @RequestParam(name ="bizZipCode", required = false) int bizZipCode
//			, @RequestParam(name ="roadAddress", required = false) String roadAddress
//			, @RequestParam(name ="detailAddress", required = false) String detailAddress
//			, @RequestParam(name ="bizLocation", required = false) String bizLocation
//			// 
//			, @RequestParam(name ="bizPhone", required = false) String bizPhone
//			, @RequestParam(name ="bizFax", required = false) String bizFax
//			, @RequestParam(name ="bizEmail", required = false) String bizEmail
//			, @RequestParam(name ="bizHp", required = false) String bizHp
//			
//			, @RequestParam(name ="phoneOpTime", required = false) String phoneOpTime
//			, @RequestParam(name ="phoneOpTimeUsim", required = false) String phoneOpTimeUsim
//			, @RequestParam(name ="bizCardPayDate", required = false) String bizCardPayDate
//			, @RequestParam(name ="bizAccPayDate", required = false) String bizAccPayDate
//			, @RequestParam(name ="bizBeginTime", required = false) String bizBeginTime
//			, @RequestParam(name ="bizEndTime", required = false) String bizEndTime
			//고객센터번호
			, @RequestParam(name ="KtService", required = false) String KtService
			, @RequestParam(name ="SktService", required = false) String SktService
			, @RequestParam(name ="LguService", required = false) String LguService
//			
			, @RequestParam(name = "weekday", required = false) String[] selectedWeekdays
			, @RequestParam(name="net", required = false) String[] selectedNetworks
			
			//파일 첨부
			, @RequestParam(name="logo", required = false) MultipartFile multi
			) {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : " + bizid);
		
		
		//요금제 테이블의 bizName도 변경 bizid, bizName
		String beforeBizName = service.getBeforeBizName(bizid);
		System.out.println("수정전 법인명 : "+beforeBizName);
		System.out.println("수정후 법인명 : "+bizName);
		//plan_table의 bizName 업데이트, 여기서 먼저 수정하고 biz 테이블이 수정되어야 함. 순서
		service.updatePlanTable(beforeBizName, bizName);
		
		
		
		//파일첨부
		Map<String, String> filePath;
		
		try {
			filePath = fileUtil.saveFile(multi, request, null);
			vo.setLogoRenameFilename(filePath.get("rename"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(vo.getLogoRenameFilename());
		
		//고객센터번호
		List<bizInfoMngServiceVo> netServiceList = new ArrayList<>();

		bizInfoMngServiceVo netService1 = new bizInfoMngServiceVo();
		netService1.setNetNo(1);
		netService1.setBizNetService(KtService);
		netService1.setBizId(bizid);
		netServiceList.add(netService1);
		
		
		bizInfoMngServiceVo netService2 = new bizInfoMngServiceVo();
		netService2.setNetNo(2);
		netService2.setBizNetService(SktService);
		netService2.setBizId(bizid);
		netServiceList.add(netService2);
		
		bizInfoMngServiceVo netService3 = new bizInfoMngServiceVo();
		netService3.setNetNo(3);
		netService3.setBizNetService(LguService);
		netService3.setBizId(bizid);
		netServiceList.add(netService3);
		
		System.out.println("######netServiceList : "+netServiceList);
		
		service.modifyNetService(netServiceList);

		
		//(휴무일) 한 문자열에 담기
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

		//(통신망) 한 문자열에 담기
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

		// 한 번에 담아오게 수정할 것.. 그럼 문자열 쪼개는 것을 jsp 에서..?하지말자..
		//vo에 담기
		vo.setBizName(bizName);
//		vo.setBizSsn(bizSsn);
//		vo.setBizCrn(bizCrn);
//		vo.setBizEmail(bizEmail);
//		vo.setBizPhone(bizPhone);
//		vo.setBizFax(bizFax);
//		vo.setBizOwnerName(bizOwnerName);
//		vo.setBizHp(bizHp);
//		vo.setBizZipCode(bizZipCode);
//		vo.setBizLocation(bizLocation);
//		vo.setBizCardPayDate(bizCardPayDate);
//		vo.setBizAccPayDate(bizAccPayDate);
//		vo.setBizBeginTime(bizBeginTime);
//		vo.setBizEndTime(bizEndTime);
//		vo.setBizClosedDay(bizClosedDay);
//		vo.setPhoneOpTime(phoneOpTime);
//		vo.setPhoneOpTimeUsim(phoneOpTimeUsim);
		vo.setNetwork(network);
		vo.setBizId(bizid);
		
		service.modifyBizInfo(vo);
		System.out.println("@@수정하기 버튼 누른 후 vo :"+vo);

		
		
		return "redirect:/biz/infodetail";
		
	}
}

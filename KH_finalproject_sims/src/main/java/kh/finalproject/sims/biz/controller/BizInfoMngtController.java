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
import kh.finalproject.sims.biz.model.vo.BizInfoMngServiceVo;
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
			)throws Exception {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		BizInfoMngtVo vo =service.selectBizInfoDetail(bizid);
		System.out.println(vo);
		
		//고객센터 번호
		List<BizInfoMngServiceVo> serviceList = service.selectListService(bizid);
		System.out.println("고객센터번호serviceList :"+ serviceList);
	
	
		mv.addObject("bizinfo", vo);
		System.out.println("vo에 담은 bizinfo : "+vo);
		mv.addObject("serviceList",serviceList);
		System.out.println("serviceList : "+serviceList);
		
		
		String imagePath;
		if (vo.getLogoRenameFilename() == null && vo.getOriginalFilename() == null) {
		  // 대체 이미지 링크
		  imagePath = "/resources/img/default_logo.png";
		} else if (vo.getLogoRenameFilename() == null) {
		  imagePath = "/resources/img/" + vo.getOriginalFilename();
		} else {
		  imagePath = "/resources/img/" + vo.getLogoRenameFilename();
		}
		mv.addObject("imagePath", imagePath);
		System.out.println("imagePath : "+imagePath);
		
		//String imagePath ="/resources/img/"+vo.getOriginalFilename();
		mv.addObject("imagePath",imagePath);
		mv.setViewName("biz/bizInfo");
		return mv;
	}
	
	//내 정보 수정하기 - 기본값 출력용
	@GetMapping("/modifyInfo")
	public ModelAndView modifyBizInfo(ModelAndView mv
			, Principal principal
			)throws Exception {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : "+bizid);
		
		BizInfoMngtVo vo =service.selectBizInfoDetail(bizid);
		System.out.println(vo);
		
		service.insertServicList(bizid);
		
		//고객센터 번호
		List<BizInfoMngServiceVo> serviceList = service.selectListService(bizid);
		System.out.println("serviceList :"+serviceList);

		mv.addObject("bizinfo", vo);
		mv.addObject("serviceList",serviceList);
		
		
		mv.setViewName("biz/bizInfoModify");
		return mv;
	}


	
	//내 정보 수정하기
	@PostMapping("/modifyInfo")
	public String modifyBizInfo(HttpServletRequest request
			, Principal principal
			, @ModelAttribute BizInfoMngtVo vo
			, BizInfoMngServiceVo svo
			, @RequestParam(name ="bizName" , required = false) String bizName

			//고객센터번호
			, @RequestParam(name ="KtService", required = false) String KtService
			, @RequestParam(name ="SktService", required = false) String SktService
			, @RequestParam(name ="LguService", required = false) String LguService
//			
			, @RequestParam(name = "weekday", required = false) String[] selectedWeekdays
			, @RequestParam(name="net", required = false) String[] selectedNetworks
			
			//파일 첨부
			, @RequestParam(name="logo", required = false) MultipartFile multi
			, @RequestParam(name="originalFilename", required = false) String originalFilename
			, @RequestParam(name="logoRenameFilename", required = false) String logoRenameFilename
			)throws Exception {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : " + bizid);
		
		
		System.out.println("파일첨부하지 않고 히든으로 숨겨놓은 originalFilename :"+originalFilename);
		
		//요금제 테이블의 bizName도 변경 bizid, bizName
		String beforeBizName = service.getBeforeBizName(bizid);
		System.out.println("수정전 법인명 : "+beforeBizName);
		System.out.println("수정후 법인명 : "+bizName);
		//plan_table의 bizName 업데이트, 여기서 먼저 수정하고 biz 테이블이 수정되어야 함. 순서
		service.updatePlanTable(beforeBizName, bizName);
		
		
		
		//파일첨부
		System.out.println("&&&&&&&&&&&&&&&& multi : "+multi);
		System.out.println("%%%%%%% multi.getOriginalFilename() : "+multi.getOriginalFilename());
		
		Map<String, String> filePath;
		
		System.out.println("vo.getLogoRenameFilename() :"+vo.getLogoRenameFilename());
		

		try {
		    filePath = fileUtil.saveFile(multi, request, null);
		    String logoRenameFilename2 = filePath.get("rename"); //새로 들어오는 이미지파일
		    if (multi.getOriginalFilename() == null || multi.getOriginalFilename().isEmpty()) { // 이미지 파일이 선택되지 않은 경우
		        logoRenameFilename2 = vo.getLogoRenameFilename(); // 이전에 저장된 파일 이름 사용
		    }
		    vo.setLogoRenameFilename(logoRenameFilename2);
		} catch (Exception e) {
		    e.printStackTrace();
		}


		
		System.out.println("vo.getLogoRenameFilename()"+vo.getLogoRenameFilename());
		
		//고객센터번호
		List<BizInfoMngServiceVo> netServiceList = new ArrayList<>();

		BizInfoMngServiceVo netService1 = new BizInfoMngServiceVo();
		netService1.setNetNo(1);
		netService1.setBizNetService(KtService);
		netService1.setBizId(bizid);
		netServiceList.add(netService1);
		
		
		BizInfoMngServiceVo netService2 = new BizInfoMngServiceVo();
		netService2.setNetNo(2);
		netService2.setBizNetService(SktService);
		netService2.setBizId(bizid);
		netServiceList.add(netService2);
		
		BizInfoMngServiceVo netService3 = new BizInfoMngServiceVo();
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
		    selectedWeekdaysString.append("미등록");
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
		    selectedNetworksString.append("미등록");
		}
		

		String network = selectedNetworksString.toString();
		System.out.println(network);

		//vo에 담기
		vo.setBizName(bizName);
		vo.setBizClosedDay(bizClosedDay);
		vo.setNetwork(network);
		vo.setBizId(bizid);
		
	
		
		service.modifyBizInfo(vo);
		System.out.println("@@수정하기 버튼 누른 후 vo :"+vo);

		
		
		return "redirect:/biz/infodetail";
		
	}
}

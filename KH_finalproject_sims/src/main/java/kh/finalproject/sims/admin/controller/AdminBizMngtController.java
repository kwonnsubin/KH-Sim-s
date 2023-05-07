package kh.finalproject.sims.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.admin.model.service.AdminBizMngtService;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;
import kh.finalproject.sims.common.page.Search;

import kh.finalproject.sims.common.file.FileUtil;

@RequestMapping("/admin")
@Controller
@PropertySource("classpath:properties/sims2.properties")
public class AdminBizMngtController {

	@Autowired
	private AdminBizMngtService service;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	@Autowired
	private Environment env;

	public Map<String, String> paginationInfo(String pageNumber, HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		
		int pNum;
		if(pageNumber == null || pageNumber.isEmpty()) {
			pNum = 1;
		} else {
			pNum = Integer.parseInt(pageNumber);
		}
		
		Cookie cookie = null;
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			if(c.getName().equals("cnt")) {
				cookie = c;
			}
		}
		
		String cnt = request.getParameter("cnt");
		if(cnt != null) {
			if(cnt.isEmpty()) {
				if(cookie != null) {
					cnt = cookie.getValue();
				} else {
					cnt = "10";
				}
			}
		} else {
			if(cookie != null) {
				cnt = cookie.getValue();
			} else {
				cnt = "10";
			}
		}
		
		cookie = new Cookie("cnt", cnt);
		cookie.setMaxAge(60 * 60 * 24 * 5);
		response.addCookie(cookie);
		
		map.put("pNum", String.valueOf(pNum));
		map.put("cnt", cnt);
		
		return map;
		
	}
	
	// 통신사 리스트로 이동
	@RequestMapping(value = "/applyList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectApplyList(ModelAndView mv, AdminBizMngtVo vo, @RequestParam(value="p", required = false) String pageNumber, HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, String> paginationInfo = paginationInfo(pageNumber, request, response);
		int pNum = Integer.parseInt(paginationInfo.get("pNum"));
		int cnt = Integer.parseInt(paginationInfo.get("cnt"));
		String searchOption = vo.getSearchOption();
		String searchRadioVal = vo.getSearchRadioVal();
		String searchBox = vo.getSearchBox();
		Search search = service.selectApplyList(pNum, cnt, searchOption, searchRadioVal, searchBox);
		/* mv.addObject("applyList", search); */
		request.setAttribute("paging", search);
		mv.addObject("searchOption", searchOption);
		mv.addObject("searchBox", searchBox);
		mv.addObject("searchRadioVal", searchRadioVal);
		mv.setViewName("admin/biz/applyList");
		return mv;
	}

	// 통신사 신청정보 상세 페이지로 이동
	@GetMapping("/applyDetail/{bizId}")
	public ModelAndView selectApplyDetail(ModelAndView mv, @PathVariable String bizId, HttpServletRequest request, HttpServletResponse response, @RequestParam(value="p", required = false) String pageNumber,
			AdminBizMngtVo vo) throws Exception {
		String divCheck = request.getParameter("divCheck");
		
		Map<String, String> paginationInfo = null;
		int pNum = 0;
		int cnt = 0;
		String searchOption = vo.getSearchOption();
		String searchRadioVal = vo.getSearchRadioVal();
		String searchBox = vo.getSearchBox();
		Search search = null;
		
		switch (divCheck) {
		case "apply":
			mv.setViewName("admin/biz/applyDetail");
			break;
		case "detail":
			paginationInfo = paginationInfo(pageNumber, request, response);
			pNum = Integer.parseInt(paginationInfo.get("pNum"));
			cnt = Integer.parseInt(paginationInfo.get("cnt"));
			searchRadioVal = bizId;
			search = service.selectBizPlanList(pNum, cnt, searchOption, searchRadioVal, searchBox);
			mv.setViewName("admin/biz/bizDetail");
			/* mv.addObject("bizPlanList", service.selectBizPlanList(bizId)); */
			break;
		default:
			paginationInfo = paginationInfo(pageNumber, request, response);
			pNum = Integer.parseInt(paginationInfo.get("pNum"));
			cnt = Integer.parseInt(paginationInfo.get("cnt"));
			searchRadioVal = bizId;
			search = service.selectBizPlanList(pNum, cnt, searchOption, searchRadioVal, searchBox);
			mv.setViewName("admin/biz/bizDetail");
			/* mv.addObject("bizPlanList", service.selectBizPlanList(bizId)); */
			break;
		}
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("cmd", "read");
		String imagePath;
		
		String webServerRoot = request.getSession().getServletContext().getRealPath("");
		String savePath = webServerRoot + env.getProperty("local.repository");
		
		if(applyDetail.getLogoRenameFilename() == null) {
			imagePath ="/resources/img/"+applyDetail.getOriginalFilename();
		} else {
			/* imagePath = savePath + "\\" + applyDetail.getLogoRenameFilename(); */
			imagePath ="/resources/uploadfiles/"+applyDetail.getLogoRenameFilename();
		}
		System.out.println("imagePath ::: " +imagePath);
		request.setAttribute("paging", search);
		mv.addObject("searchOption", searchOption);
		mv.addObject("searchBox", searchBox);
		mv.addObject("searchRadioVal", searchRadioVal);
		mv.addObject("divCheck", divCheck);
		
		mv.addObject("imagePath",imagePath);
		return mv;
	}

	// 통신사 검토결과 변경
	@PostMapping("/updateBizStatus")
	public ModelAndView updateBizStatus(ModelAndView mv, AdminBizMngtVo vo, HttpServletRequest request, HttpServletResponse response, @RequestParam(value="p", required = false) String pageNumber) throws Exception {
		service.updateBizStatus(vo);
		
		String divCheck = request.getParameter("divCheck");
		
		Map<String, String> paginationInfo = null;
		int pNum = 0;
		int cnt = 0;
		String searchOption = vo.getSearchOption();
		String searchRadioVal = vo.getSearchRadioVal();
		String searchBox = vo.getSearchBox();
		Search search = null;

		String bizId = vo.getBizId();
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		paginationInfo = paginationInfo(pageNumber, request, response);
		pNum = Integer.parseInt(paginationInfo.get("pNum"));
		cnt = Integer.parseInt(paginationInfo.get("cnt"));
		searchRadioVal = bizId;
		search = service.selectBizPlanList(pNum, cnt, searchOption, searchRadioVal, searchBox);
		request.setAttribute("paging", search);
		mv.addObject("searchOption", searchOption);
		mv.addObject("searchBox", searchBox);
		mv.addObject("searchRadioVal", searchRadioVal);
		mv.addObject("divCheck", divCheck);
		
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("result", "수정이 완료되었습니다.");
		mv.addObject("cmd", "read");
		mv.setViewName("admin/biz/bizDetail");
		return mv;
	}

	// 통신사 상세 수정 페이지로 이동
	@GetMapping("/selectBizModify/{bizId}")
	public ModelAndView selectBizModify(ModelAndView mv, @PathVariable String bizId, AdminBizMngtVo vo,  HttpServletRequest request, HttpServletResponse response, @RequestParam(value="p", required = false) String pageNumber)
			throws Exception {
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("cmd", "update");
		
		String imagePath;
		if(applyDetail.getLogoRenameFilename() == null) {
			imagePath ="/resources/img/"+applyDetail.getOriginalFilename();
		} else {
			imagePath ="/resources/img/"+applyDetail.getLogoRenameFilename();
		}
		
		mv.addObject("imagePath",imagePath);
		
		Map<String, String> paginationInfo = paginationInfo(pageNumber, request, response);
		int pNum = Integer.parseInt(paginationInfo.get("pNum"));
		int cnt = Integer.parseInt(paginationInfo.get("cnt"));
		String searchOption = vo.getSearchOption();
		String searchRadioVal = vo.getSearchRadioVal();
		String searchBox = vo.getSearchBox();
		searchRadioVal = bizId;
		Search search = service.selectBizPlanList(pNum, cnt, searchOption, searchRadioVal, searchBox);
		/* mv.addObject("applyList", search); */
		request.setAttribute("paging", search);
		mv.addObject("searchOption", searchOption);
		mv.addObject("searchBox", searchBox);
		mv.addObject("searchRadioVal", searchRadioVal);
		
		/* mv.addObject("bizPlanList", service.selectBizPlanList(bizId)); */
		mv.setViewName("/admin/biz/bizDetail");
		return mv;
	}

	// 통신사 상세 수정하기
	@PostMapping("/saveBizModify")
	public ModelAndView saveBizModify(ModelAndView mv, AdminBizMngtVo vo, HttpServletRequest request
			//파일 첨부
			, @RequestParam(name="logo", required = false) MultipartFile multi
			, @RequestParam(name="originalFilename", required = false) String originalFilename
			, @RequestParam(name="logoRenameFilename", required = false) String logoRenameFilename) throws Exception {
		
		// 파일 첨부
		Map<String, String> filePath;
		try {
		    filePath = fileUtil.saveFile(multi, request, null);
		    System.out.println("filePath ::: " + filePath);
		    String logoRenameFilename2 = filePath.get("rename"); //새로 들어오는 이미지파일
		    if (multi.getOriginalFilename() == null || multi.getOriginalFilename().isEmpty()) { // 이미지 파일이 선택되지 않은 경우
		        logoRenameFilename2 = vo.getLogoRenameFilename(); // 이전에 저장된 파일 이름 사용
		    }
		    vo.setLogoRenameFilename(logoRenameFilename2);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		
		service.saveBizModify(vo);	// 통신사 정보 수정
		service.saveNetServiceModify(vo);	// 통신사 통신망 수정 (고객센터번호)
		String bizId = vo.getBizId();
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("result", "수정이 완료되었습니다.");
		mv.addObject("cmd", "read");
		mv.setViewName("admin/biz/bizDetail");
		return mv;
	}

	// 통신사 탈퇴 상세 정보로 이동
	@GetMapping("/withdrawalDetail/{bizId}")
	public ModelAndView selectWithdrawalDetail(ModelAndView mv, @PathVariable String bizId) throws Exception {
		AdminBizMngtVo withdrawalDetail = service.selectWithdrawalDetail(bizId);
		mv.addObject("withdrawalDetail", withdrawalDetail);
		mv.setViewName("admin/biz/withdrawalDetail");
		mv.addObject("cmd", "read");
		return mv;
	}
	
	// 통신사 탈퇴 확정
	@PostMapping("/updateWithdrawalBizStatus")
	public ModelAndView updateWithdrawalBizStatus(ModelAndView mv, AdminBizMngtVo vo) throws Exception {
		service.updateWithdrawalBizStatus(vo);

		String bizId = vo.getBizId();
		AdminBizMngtVo withdrawalDetail = service.selectWithdrawalDetail(bizId);
		mv.addObject("withdrawalDetail", withdrawalDetail);
		mv.addObject("result", "탈퇴 되었습니다.");
		mv.setViewName("admin/biz/withdrawalDetail");
		mv.addObject("cmd", "read");
		return mv;
	}

	// 통신사 요금제 개통 신청 리스트로 이동
	@RequestMapping(value = "/bizPlanApplyList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectBizPlanApplyList(ModelAndView mv, AdminBizMngtVo vo, @RequestParam(value="p", required = false) String pageNumber, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> paginationInfo = paginationInfo(pageNumber, request, response);
		int pNum = Integer.parseInt(paginationInfo.get("pNum"));
		int cnt = Integer.parseInt(paginationInfo.get("cnt"));
		String searchOption = vo.getSearchOption();
		String searchRadioVal = vo.getSearchRadioVal();
		String searchBox = vo.getSearchBox();
		Search search = service.selectBizPlanApplyList(pNum, cnt, searchOption, searchRadioVal, searchBox);
		
		request.setAttribute("paging", search);
		/* mv.addObject("bizPlanApplyList", service.selectBizPlanApplyList(vo)); */
		mv.addObject("searchOption", searchOption);
		mv.addObject("searchBox", searchBox);
		mv.addObject("searchRadioVal", searchRadioVal);
		mv.setViewName("admin/biz/planApplyList");
		return mv;
	}

	// 통신사 요금제 개통 신청 상세 페이지로 이동
	@GetMapping("/bizPlanApplyDetail/{orderNo}") 
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv, @PathVariable int orderNo) throws Exception {
		AdminBizMngtVo bizPlanApplyDetail =service.selectBizPlanApplyDetail(orderNo);
		mv.addObject("bizPlanApplyDetail",bizPlanApplyDetail);
		mv.setViewName("admin/biz/planApplyDetail");
		mv.addObject("cmd", "read"); 
		return mv; 
	}
	
	// 요금제 상세 정보 호출 ajax
	@PostMapping("/selectPlanAjax")
	@ResponseBody
	public String selectPlanAjax(HttpServletRequest request) throws Exception {
		int planNo = Integer.parseInt(request.getParameter("planNo"));
		AdminBizMngtVo selectPlanAjax = service.selectPlanAjax(planNo);
		Gson gson = new Gson();
		String json = gson.toJson(selectPlanAjax);
		return json;
	}
}

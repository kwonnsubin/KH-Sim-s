package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;
import kh.finalproject.sims.biz.model.vo.bizInfoMngServiceVo;

@Controller
@RequestMapping("/biz")
public class BizInfoMngtController {
	
	@Autowired
	private BizInfoMngtService service;
	
	/*
	 * @GetMapping("/infodetail") public ModelAndView
	 * selectBizInfoDetail(ModelAndView mv) throws Exception { mv.addObject("info",
	 * service.selectList()); mv.setViewName("biz/info");
	 * 
	 * return mv; }
	 */

	//내 정보관리 상세
	@GetMapping("infodetail")
	public ModelAndView selectBizInfoDetail(ModelAndView mv
			, HttpServletRequest request
			) {
		//Principal principal = request.getUserPrincipal(); //통신사 아이디를 어떻게?
		//String bizid = principal.getName();
		//System.out.println("통신사아이디"+bizid);
		BizInfoMngtVo vo =service.selectBizInfoDetail();
		System.out.println(vo);
		
		//고객센터 번호
		List<bizInfoMngServiceVo> serviceList = service.selectListService();
		System.out.println(serviceList);
	
	
		mv.addObject("bizinfo", vo);
		mv.addObject("serviceList",serviceList);
		
		String imagePath ="/resources/img/"+vo.getLogoRenameFilename();
		mv.addObject("imagePath",imagePath);
		mv.setViewName("biz/info");
		return mv;
	}
}

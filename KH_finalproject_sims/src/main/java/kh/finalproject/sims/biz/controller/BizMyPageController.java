package kh.finalproject.sims.biz.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizMyPageService;
import kh.finalproject.sims.biz.model.vo.BizMyPageVo;

@Controller
@RequestMapping("/biz")
public class BizMyPageController {

	
	@Autowired
	private BizMyPageService service;
	
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
			 
			 mv.setViewName("/biz/myPage");
			 
			 BizMyPageVo vo = service.getLogo(bizid);
			 System.out.println("로고 : "+vo);
			 
			 String imagePath;
				if (vo.getLogoRenameFilename() == null) {
				  imagePath = "/resources/img/" + vo.getOriginalFilename();
				} else {
				  imagePath = "/resources/img/" + vo.getLogoRenameFilename();
				}
			 mv.addObject("imagePath",imagePath);
			 
			 return mv;
		 }
}

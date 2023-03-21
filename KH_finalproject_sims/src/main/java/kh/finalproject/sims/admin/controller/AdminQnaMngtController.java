package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminQnaMngtService;

@RequestMapping("/admin")
@Controller
public class AdminQnaMngtController {

	@Autowired
	AdminQnaMngtService service;
	
	// 자주 묻는 질문 화면 리스트
	@GetMapping("/faqlist")
	public ModelAndView selectFaqList(ModelAndView mv) {
		mv.addObject("faqlist", service.selectFaqList());
		mv.setViewName("admin/faqlist");
		return mv;	
	}
	
	// 자주 묻는 질문 화면 상세보기
	@GetMapping("/faqdetail/{faqNo}")
	public ModelAndView selectQnaListDetail(
			ModelAndView mv,
			@PathVariable int faqNo
			) {
		mv.addObject("faqcontents", service.selectFaqDetail(faqNo));
		mv.setViewName("admin/faqdetail");
		return mv;
	}
	
	// 자주 묻는 질문 화면 작성하기
	@GetMapping("/faqwrite")
	public ModelAndView viewInsertfaq(
			ModelAndView mv
			) {
		mv.setViewName("admin/faqwrite");
		return mv;
	}
	
//	@PostMapping("/faqwrite")
		
			
}

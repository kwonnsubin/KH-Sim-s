package kh.finalproject.sims.admin.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalproject.sims.admin.model.service.AdminQnaMngtService;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;

@RequestMapping("/admin")
@Controller
public class AdminQnaMngtController {

	@Autowired
	AdminQnaMngtService service;
	
	// 자주묻는질문화면 리스트
	@GetMapping("/faqlist")
	public ModelAndView selectFaqList(ModelAndView mv) {
		mv.addObject("faqlist", service.selectFaqList());
		mv.setViewName("admin/faqlist");
		return mv;	
	}
	
	// 자주묻는질문화면 상세내용 보기
	@GetMapping("/faqdetail/{faqNo}")
	public ModelAndView selectQnaListDetail(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		mv.addObject("faqcontents", service.selectFaqDetail(faqNo));
		mv.setViewName("admin/faqdetail");
		return mv;
	}
	
	// 자주묻는질문화면 작성 페이지
	@GetMapping("/faqwrite")
	public ModelAndView viewInsertFaq(
			  ModelAndView mv
			, HttpServletRequest request // 사용자(관리자)정보 가져오기
			) {
		mv.setViewName("admin/faqwrite");
		Principal principal = request.getUserPrincipal(); // 사용자(관리자)정보 가져오기
	    String username = principal.getName(); // 사용자(관리자)정보 가져오기
	    
	    mv.addObject("username", username);
		return mv;
	}
	
	// 자주묻는질문 작성
	@PostMapping("/faqwrite")
	public ModelAndView faqwrite(
			ModelAndView mv
		  , AdminQnaMngtVo vo
			) {
		service.insertFaqWrite(vo);
		mv.setViewName("redirect:/admin/faqlist");
		return mv;
	}
	
	
	// 자주묻는질문 수정 페이지
	@GetMapping("/faqupdate/{faqNo}")
	public ModelAndView viewUpdateFaq(
			ModelAndView mv
		  , @PathVariable int faqNo
			) {
		mv.setViewName("admin/faqupdate");
		return mv;
	}
	
	
	// 자주묻는질문 수정하기
	@PostMapping("/faqupdate") // 왜 url이 두개나오는거지?? 해결중!!!!!!!!!
	public ModelAndView selectFaqModify(
		    ModelAndView mv
		   ,AdminQnaMngtVo vo) {
		service.selectFaqModify(vo);
		mv.setViewName("redirect:/admin/faqdetail/vo.getFaqNo()");
		return mv;
	}
	
	
	

			
}

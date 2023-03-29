package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserFaqService;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

@RequestMapping("/faq")
@Controller
public class UserFaqController {
	
	@Autowired
	UserFaqService service;
	
	// 질문 목록
	@GetMapping("/faqlist")
	public ModelAndView selectFaqList(ModelAndView mv) {
		mv.addObject("faqlist", service.selectFaqList());
		mv.addObject("qnalist", service.selectQnaList());
		mv.setViewName("user/faq/faqlist");
		return mv;
	}
	
	// 자주묻는질문 상세보기
	@GetMapping("/faqread/{faqNo}")
	public ModelAndView readFaq(
			ModelAndView mv, 
			@PathVariable int faqNo
			) {
		mv.addObject("faqcontents", service.selectFaqDetail(faqNo));
		mv.setViewName("user/faq/faqread");
		return mv;
	}
	
	// 문의게시판 질문 상세보기
	@GetMapping("/qna/{aqNo}")
	public ModelAndView readQna(
			ModelAndView mv
			, @PathVariable int aqNo
			) {
		service.viewCount(aqNo);
		UserQnaVo question = service.selectQnaDetail(aqNo);
		List<UserAnsVo> answers = service.selectAnsList(aqNo);
		mv.addObject("question", question);
		mv.addObject("answers", answers);
		mv.setViewName("user/faq/readQna");
		return mv;
	}
	
	// 답변달기
	@PostMapping("/qna/{aqNo}/answer")
	public String insertAnswer(
			@PathVariable int aqNo
			, UserAnsVo vo
			, Authentication authentication
			) {
		service.insertAnswer(aqNo, vo);
		service.upAnswers(aqNo);
		return "redirect:/faq/qna/" + aqNo;
	}
	
	// 댓글달기
	@PostMapping("/ans/{aaNo}/reply")
	public String insertReply(
			@PathVariable int aaNo
			, UserRplVo vo
			, Authentication authentication
			) {
		service.insertReply(aaNo, vo);
		UserAnsVo ansVo = service.getAnsByNo(aaNo);
		return "redirect:/faq/qna/" + ansVo.getAqNo();
	}
	
	// 질문하기 페이지
	@GetMapping("/qna/write")
	public ModelAndView writeQnaForm(
			ModelAndView mv
			, HttpServletRequest request
			) {
		mv.setViewName("user/faq/writeQna");
		Principal principal = request.getUserPrincipal();
		String username = principal.getName();
		
		mv.addObject("username", username);
		return mv;
	}
	
	// 질문 저장
	@PostMapping("/qna/write")
	public String writeQna(
			UserQnaVo vo
			, Authentication authentication
			) {
		service.insertQna(vo);
		return "redirect:/faq/faqlist";
	}
	
	// 내 질문답변
	@GetMapping("/myqna")
	public ModelAndView selectMyQnaList(
			ModelAndView mv
			, HttpServletRequest request
			) {
		Principal principal = request.getUserPrincipal();
		String username = principal.getName();
		
		mv.addObject("myqnalist", service.selectMyQnaList(username));
		mv.addObject("myanslist", service.selectMyAnsList(username));
		mv.setViewName("user/faq/myQna");
		return mv;
	}
	
	// 내 질문 삭제
	@GetMapping("/qnadelete/{aqNo}")
	public ModelAndView deleteQna(
			  ModelAndView mv
			, @PathVariable int aqNo
			) {
		service.deleteQna(aqNo);
		mv.setViewName("redirect:/faq/myqna");
		return mv;
	}
	
	// 내 답변 삭제
	@GetMapping("/ansdelete/{aqNo}/{aaNo}")
	public ModelAndView deleteAns(
			ModelAndView mv
			, @PathVariable int aqNo
			, @PathVariable int aaNo
			) {
		service.deleteAns(aaNo);
		service.deAnswers(aqNo);
		mv.setViewName("redirect:/faq/myqna");
		return mv;
	}
	
	// 내 질문 수정 페이지
	@GetMapping("/qnaupdate/{aqNo}")
	public ModelAndView updateQnaForm(
			ModelAndView mv
		  , @PathVariable int aqNo
			) {
		mv.addObject("myqna", service.selectQnaDetail(aqNo)); 
		mv.setViewName("user/faq/updateQna");
		return mv;
	}
	
	// 내 질문 수정하기
	@PostMapping("/qnaupdate/{aqNo}") 
	public ModelAndView updateQna(
		     ModelAndView mv
		   , @PathVariable int aqNo
		   , UserQnaVo vo) {
		service.updateQna(vo);
		mv.setViewName("redirect:/faq/qna/"+vo.getAqNo());
		return mv;
	}
}

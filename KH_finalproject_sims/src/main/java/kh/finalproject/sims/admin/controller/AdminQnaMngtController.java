package kh.finalproject.sims.admin.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.finalproject.sims.admin.model.service.AdminQnaMngtService;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;

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
	public ModelAndView selectFaqDetail(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result);
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
		  , AdminFaqVo vo
			) {
		service.insertFaqWrite(vo);
		mv.setViewName("redirect:/admin/faqlist");
		return mv;
	}
	
	
	// 자주묻는질문 수정 페이지로 이동
	@GetMapping("/faqupdate/{faqNo}")
	public ModelAndView viewUpdateFaq(
			ModelAndView mv
		  , @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result); // 기존 내용 띄우기
		mv.setViewName("admin/faqupdate");
		return mv;
	}
	
	
	// 자주묻는질문 수정하기
	@PostMapping("/faqupdate/{faqNo}") // 왜 url이 두개나오는거지??(faqupdate.jsp) 해결중!!!!!!!!!
	public ModelAndView selectFaqModify(
		     ModelAndView mv
		   , @PathVariable int faqNo
		   , AdminFaqVo vo) {
		service.selectFaqModify(vo);
		mv.setViewName("redirect:/admin/faqdetail/"+vo.getFaqNo());
		return mv;
	}
	
	// 자주묻는질문 삭제하기
	@GetMapping("/faqdelete/{faqNo}")
	public ModelAndView deleteFaq(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		service.deleteFaq(faqNo);
		mv.setViewName("redirect:/admin/faqlist");
		return mv;
	}
	
	// 문의내역 리스트
	@GetMapping("/qna/list")
	public ModelAndView selectQnaList(ModelAndView mv) {
		List<AdminQnaMngtVo> list = service.selectQnaList();
		mv.addObject("qnalist", list);
		mv.setViewName("admin/qna/list");
		return mv;
	}
	
	// 문의내역 상세보기
	@GetMapping("/qna/detail/{aqNo}")
	public ModelAndView selectQnaListDetail(
			ModelAndView mv
			,@PathVariable int aqNo
			,AdminQnaMngtVo vo
			, HttpServletRequest request // 사용자(관리자)정보 가져오기
			) {
		Principal principal = request.getUserPrincipal(); // 사용자(관리자)정보 가져오기
	    String username = principal.getName(); // 사용자(관리자)정보 가져오기
		mv.addObject("qnaDetail", service.selectQnaListDetail(aqNo)); 
		mv.setViewName("admin/qna/detail");
		
		mv.addObject("qnaAnsList", service.selectQnaAnsList(aqNo));
	    mv.addObject("username", username);
	    mv.addObject("aqNo", aqNo);
		return mv;
	}
	
//	// 문의내역 상세보기 JOIN
//	@GetMapping("/qna/detail/{aqNo}")
//	public ModelAndView selectQnaListDetail(
//			ModelAndView mv
//			,@PathVariable int aqNo
//			) {
//		List<AdminQnaMngtVo> list = service.selectQnaListDetail(aqNo);
//		mv.addObject("qnaDetail", list);
//		mv.setViewName("admin/qna/detail");
//		return mv;
//	}
	
	// 문의내역 답변 작성 ajax
	@ResponseBody
	@PostMapping("/qna/insertAns")
	public String insertQnaAnsWrite(
			 AdminQnaAnsVo vo
			) {
		int result = service.insertQnaAnsWrite(vo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 문의내역 불러오기 test!!!!!!!
	@ResponseBody
	@GetMapping(value="/qna/ansList", produces = "application/json;charset=utf-8")
	public String ansList(
			@RequestParam("aqNo") int aqNo)
			{
			service.selectQnaListDetail(aqNo);
			List<AdminQnaAnsVo> qnaAnsList = service.selectQnaAnsList(aqNo);
			if(!qnaAnsList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				// GSON 객체를 만들 때 date 포맷은 이렇게 해서 만들어주세요!라는 뜻
				return gson.toJson(qnaAnsList);
			}
			return null;
	}
	
	// 문의내역 댓글 작성 
	@PostMapping("/qna/insertReply")
	public ModelAndView insertQnaAnsWrite(
			ModelAndView mv
			, AdminQnaReplyVo vo
			) {
		service.insertQnaReplyWrite(vo);
		return mv;
	}
	
	

	
	
	
}

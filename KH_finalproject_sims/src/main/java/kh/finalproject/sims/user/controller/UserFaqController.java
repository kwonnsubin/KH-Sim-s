package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.finalproject.sims.common.page.Search;
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
	@GetMapping("/")
	public ModelAndView selectFaqList(
			ModelAndView mv
			, UserQnaVo vo
			, @RequestParam(required = false) String keyword
			, @RequestParam(required = false) String searchType
			, HttpServletRequest req
			, HttpServletResponse resp
			) {
		// 페이징
		String pageNum = req.getParameter("p");
		int pNum;
		if (pageNum == null || pageNum.isEmpty()) {
			pNum = 1;
		} else {
			pNum = Integer.parseInt(pageNum);
		}
		
		Cookie cookie = null;
		Cookie[] cookies = req.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("cnt")) {
				cookie = c;
			}
		}
		
		String cnt = req.getParameter("cnt");
		if (cnt != null) {
			if (cnt.isEmpty()) {
				if (cookie != null) {
					cnt = cookie.getValue();
				} else {
					cnt = "10"; // 초기값
				}
			}
		} else {
			if (cookie != null) {
				cnt = cookie.getValue();
			} else {
				cnt = "10";
			}
		}
		
		cookie = new Cookie("cnt", cnt);
		cookie.setMaxAge(60 * 60 * 24 * 5);
		resp.addCookie(cookie);
		
		int searchListCount = service.getSearchListCount(searchType, keyword);
		System.out.println("검색 결과 목록 개수는 " + searchListCount);
		
		Search search = service.getPage(pNum, Integer.parseInt(cnt), searchType, keyword);
		
		req.setAttribute("paging", search);
		
		System.out.println("@@@@search.getPage(): " + search.getPage());
		System.out.println("######getPageList: " + search.getPageList());
		
		mv.addObject("listCnt", searchListCount);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		
		//
		mv.addObject("faqlist", service.selectFaqList());
		// mv.addObject("qnalist", service.selectQnaList());
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
		mv.addObject("question", service.selectQnaDetail(aqNo));
		mv.addObject("answers", service.selectAnsList(aqNo));
		
		mv.setViewName("user/faq/readQna");
		return mv;
	}
	
	// 답변 불러오기 ajax
	@ResponseBody
	@GetMapping(value = "/qna/ansList", produces = "application/json;charset=utf-8")
	public String ansList(@RequestParam("aqNo") int aqNo) {
		service.selectQnaDetail(aqNo);
		List<UserAnsVo> ansList = service.selectAnsList(aqNo);
		if (!ansList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd HH:mm").create();
			return gson.toJson(ansList);
		}
		return null;
	}
	
	// 답변수 ajax
	@ResponseBody
	@GetMapping(value = "/qna/ansCount")
	public Map<String, Integer> answerCount(@RequestParam("aqNo") int aqNo) {
	    Map<String, Integer> map = new HashMap<>();
	    UserQnaVo vo = service.selectQnaDetail(aqNo);
	    int count = vo.getAqAnswers();
	    map.put("answer_count", count);
	    return map;
	}
	
	// 답변달기 ajax
	@ResponseBody
	@PostMapping(value = "/qna/{aqNo}/answer")
	public String insertAnswer(
			@PathVariable int aqNo
			, UserAnsVo vo
			) {
		int result = service.insertAnswer(aqNo, vo);
		service.upAnswers(aqNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글달기
	@PostMapping("/ans/{aaNo}/reply")
	public String insertReply(
			@PathVariable int aaNo
			, UserRplVo vo
			) {
		service.insertReply(aaNo, vo);
		UserAnsVo ansVo = service.getAnsByNo(aaNo);
		return "redirect:/faq/qna/" + ansVo.getAqNo();
	}
	
	// 질문하기 페이지
	@GetMapping("/qna/write")
	public ModelAndView writeQnaForm(
			ModelAndView mv
			, Principal principal
			) {
		mv.setViewName("user/faq/writeQna");
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
		return "redirect:/faq/";
	}
	
	// 내 질문답변
	@GetMapping("/myqna")
	public ModelAndView selectMyQnaList(
			ModelAndView mv
			, Principal principal
			) {
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
			, HttpServletRequest request
			) {
		service.deleteQna(aqNo);
		String referer = request.getHeader("Referer");
		mv.setViewName("redirect:" + referer);
		return mv;
	}
	
	// 내 답변 삭제
	@GetMapping("/ansdelete/{aqNo}/{aaNo}")
	public String deleteAns(
			@PathVariable int aqNo
			, @PathVariable int aaNo
			, HttpServletRequest request
			) {
		service.deleteAns(aaNo);
		service.deAnswers(aqNo);
		return "redirect:" + request.getHeader("Referer");
	}
	
	// 댓글 삭제
	@GetMapping("/rpldelete/{aqNo}/{aaNo}/{rplNo}")
	public String deleteRpl(
			@PathVariable int rplNo
			, @PathVariable int aaNo
			, @PathVariable int aqNo
			) {
		service.deleteRpl(rplNo);
		return "redirect:/faq/qna/"+ aqNo;
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
	
	// 내 답변 수정하기
	@PostMapping("/ansupdate/{aaNo}")
	public ModelAndView updateAns(
			ModelAndView mv
			, @PathVariable int aaNo
			, UserAnsVo vo
			) {
		service.updateAns(vo);
		mv.setViewName("redirect:/faq/qna/"+ service.getAnsByNo(aaNo).getAqNo());
		return mv;
	}
	
	// 댓글 수정하기
	@PostMapping("/rplupdate/{rplNo}")
	public ModelAndView updateRpl(
			ModelAndView mv
			, @PathVariable int rplNo
			, UserRplVo vo
			) {
		service.updateRpl(vo);
		UserRplVo rpl = service.getRplByNo(rplNo);
		UserAnsVo ans = service.getAnsByNo(rpl.getAaNo());
		mv.setViewName("redirect:/faq/qna/" + ans.getAqNo());
		return mv;
	}
	
//	// 댓글 수정 페이지
//	@GetMapping("/rplupdate/{rplNo}")
//	public ModelAndView updateRplForm(
//			ModelAndView mv
//			, @PathVariable int rplNo
//			) {
//		mv.addObject("myrpl", service.getRplByNo(rplNo));
//		mv.setViewName("user/faq/updateRpl");
//		return mv;
//	}
	
//	// 댓글달기 ajax
//	@ResponseBody
//	@PostMapping("/ans/{aaNo}/reply2")
//	public String insertReply2(
//			@PathVariable int aaNo
//			, UserRplVo vo
//			) {
//		int result = service.insertReply(aaNo, vo);
//		if (result > 0) {
//			return "success";
//		} else {
//			return "fail";
//		}
//	}
	
//	// 내 답변 수정 페이지
//	@GetMapping("/ansupdate/{aaNo}")
//	public ModelAndView updateAnsForm(
//			ModelAndView mv
//			, @PathVariable int aaNo
//			) {
//		mv.addObject("myans", service.getAnsByNo(aaNo));
//		mv.setViewName("user/faq/updateAns");
//		return mv;
//	}
}

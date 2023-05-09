package kh.finalproject.sims.user.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.common.page.Search;
import kh.finalproject.sims.user.model.service.UserFaqService;
import kh.finalproject.sims.user.model.vo.UserAnsVo;
import kh.finalproject.sims.user.model.vo.UserFaqVo;
import kh.finalproject.sims.user.model.vo.UserQnaVo;
import kh.finalproject.sims.user.model.vo.UserRplVo;

@RequestMapping("/faq")
@Controller
public class UserFaqController {
	
	@Autowired
	UserFaqService service;
	
	// 질문 목록
	@GetMapping("/")
	public ModelAndView selectFaqList (
			ModelAndView mv
			, UserQnaVo vo
			, @RequestParam(required = false) String keyword
			, @RequestParam(required = false) String searchType
			, HttpServletRequest req
			, HttpServletResponse resp
			) throws Exception {
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
		String cnt = "5";
		
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
	
		mv.addObject("faqlist", service.selectFaqList());
		mv.setViewName("user/faq/list");
		return mv;
	}
	
	// 자주묻는질문 상세보기
	@GetMapping("/{faqNo}")
	public ModelAndView readFaq(
			ModelAndView mv, 
			@PathVariable int faqNo
			) throws Exception {
		UserFaqVo faq = service.selectFaqDetail(faqNo);
		
		// 줄바꿈 처리
		faq.setFaqContent(faq.getFaqContent().replaceAll(System.lineSeparator(), "<br>"));
		
		mv.addObject("faq", faq);
		mv.setViewName("user/faq/readFaq");
		return mv;
	}
	
	// 문의게시판 질문 상세보기
	@GetMapping("/qna/{aqNo}")
	public ModelAndView readQna(
			ModelAndView mv
			, @PathVariable int aqNo
			, HttpServletRequest req
			, HttpServletResponse resp
			) throws Exception {
		String cookieName = "viewed_" + aqNo; // 현재 게시글 번호로 쿠키 이름 생성
		Cookie[] cookies = req.getCookies();
		boolean isViewed = false; // 조회 여부 변수
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					isViewed = true;
					break;
				}
			}
		}
		if (!isViewed) {
			service.viewCount(aqNo); // 조회수 증가
			Cookie cookie = new Cookie(cookieName, "viewed"); // 쿠키 생성
			cookie.setMaxAge(60*60*24); // 쿠키유효시간
			resp.addCookie(cookie);
		}
		
		UserQnaVo question = service.selectQnaDetail(aqNo);
		List<UserAnsVo> answers = service.selectAnsList(aqNo);
		mv.addObject("question", question);
		mv.addObject("answers", answers);
		
		mv.setViewName("user/faq/readQna");
		return mv;
	}
	
	//  답변달기
	@PostMapping(value = "/qna/{aqNo}/answer")
	@Transactional
	public String insertAnswer(
			@PathVariable int aqNo
			, UserAnsVo vo
			) throws Exception {
		service.insertAnswer(aqNo, vo);
		// 트리거로 변경 service.upAnswers(aqNo);
		return "redirect:/faq/qna/" + aqNo;
	}
	
	// 댓글달기
	@PostMapping("/ans/{aaNo}/reply")
	public String insertReply(
			@PathVariable int aaNo
			, UserRplVo vo
			) throws Exception {
		service.insertReply(aaNo, vo);
		UserAnsVo ansVo = service.getAnsByNo(aaNo);
		return "redirect:/faq/qna/" + ansVo.getAqNo();
	}
	
	// 질문하기 페이지
	@GetMapping("/qna/write")
	public ModelAndView writeQnaForm(
			ModelAndView mv
			, Principal principal
			) throws Exception {
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
			) throws Exception {
		service.insertQna(vo);
		return "redirect:/faq/";
	}
	
	// 내 질문답변
	@GetMapping("/myqna")
	public ModelAndView selectMyQnaList(
			ModelAndView mv
			, Principal principal
			) throws Exception {
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
			) throws Exception {
		service.deleteQna(aqNo);
		String referer = request.getHeader("Referer");
		mv.setViewName("redirect:" + referer);
		return mv;
	}
	
	// 내 답변 삭제
	@GetMapping("/ansdelete/{aqNo}/{aaNo}")
	@Transactional
	public String deleteAns(
			@PathVariable int aqNo
			, @PathVariable int aaNo
			, HttpServletRequest request
			) throws Exception {
		service.deleteAns(aaNo);
		// 트리거로 변경 service.deAnswers(aqNo);
		return "redirect:" + request.getHeader("Referer");
	}
	
	// 댓글 삭제
	@GetMapping("/rpldelete/{aqNo}/{aaNo}/{rplNo}")
	public String deleteRpl(
			@PathVariable int rplNo
			, @PathVariable int aaNo
			, @PathVariable int aqNo
			) throws Exception {
		service.deleteRpl(rplNo);
		return "redirect:/faq/qna/"+ aqNo;
	}
	
	// 내 질문 수정 페이지
	@GetMapping("/qnaupdate/{aqNo}")
	public ModelAndView updateQnaForm(
			ModelAndView mv
		  , @PathVariable int aqNo
			) throws Exception {
		mv.addObject("myqna", service.selectQnaDetail(aqNo)); 
		mv.setViewName("user/faq/updateQna");
		return mv;
	}
	
	// 내 질문 수정하기
	@PostMapping("/qnaupdate/{aqNo}") 
	public ModelAndView updateQna(
		     ModelAndView mv
		   , @PathVariable int aqNo
		   , UserQnaVo vo
		   ) throws Exception {
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
			) throws Exception {
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
			) throws Exception {
		service.updateRpl(vo);
		UserRplVo rpl = service.getRplByNo(rplNo);
		UserAnsVo ans = service.getAnsByNo(rpl.getAaNo());
		mv.setViewName("redirect:/faq/qna/" + ans.getAqNo());
		return mv;
	}
	
}

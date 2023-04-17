package kh.finalproject.sims.admin.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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

import kh.finalproject.sims.admin.model.service.AdminQnaMngtService;
import kh.finalproject.sims.admin.model.vo.AdminFaqVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaAnsVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaMngtVo;
import kh.finalproject.sims.admin.model.vo.AdminQnaReplyVo;
import kh.finalproject.sims.user.model.service.UserFaqService;

@RequestMapping("/admin")
@Controller
public class AdminQnaMngtController {

	@Autowired
	AdminQnaMngtService service;
	@Autowired
	UserFaqService userService;
	
	// 자주묻는질문화면 리스트
	@RequestMapping(value="/faq/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectFaqList(
			ModelAndView mv
			, AdminFaqVo vo
			, HttpServletRequest request
			, HttpServletResponse response
			) {
	    if(vo.getSearchOption() == null) {
	        mv.addObject("faqlist", service.selectFaqList()); // 검색이 없는경우
	    } else {
	        mv.addObject("faqlist", service.selectSearchFaqList(vo)); // 검색이 있을경우    
	        mv.addObject("searchOption", vo.getSearchOption());
	        mv.addObject("searchBox", vo.getSearchBox());
	    }
	    
	  //페이징
	  		String pageNumber = request.getParameter("p");
	  		int pNum;
	  		if (pageNumber == null || pageNumber.isEmpty()) {
	  			pNum = 1;
	  		} else {
	  			pNum = Integer.parseInt(pageNumber);
	  		}
	  	
	  		Cookie cookie = null;
	  		Cookie[] cookies = request.getCookies();
	  		for (Cookie c : cookies) {
	  			if (c.getName().equals("cnt")) {
	  				cookie = c;
	  			}
	  		}
	  	
	  		String cnt = request.getParameter("cnt");
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
	  		response.addCookie(cookie);
	  		
//	  		int searchApplyListCount = service.getSearchApplyListCount(); // 목록의 총 row를 알기 위한 getSearchApplyListCount();
//	  		Search search = service.getPage();
	    
	    mv.setViewName("admin/faq/list");
	    return mv;
	}
	
	// 자주묻는질문화면 상세내용 보기
	@GetMapping("/faq/detail/{faqNo}")
	public ModelAndView selectFaqDetail(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result);
		mv.setViewName("admin/faq/detail");
		return mv;
	}
	
	// 자주묻는질문화면 작성 페이지
	@GetMapping("/faq/write")
	public ModelAndView viewInsertFaq(
			  ModelAndView mv
			, HttpServletRequest request // 사용자(관리자)정보 가져오기
			) {
		mv.setViewName("admin/faq/write");
		Principal principal = request.getUserPrincipal(); // 사용자(관리자)정보 가져오기
	    String username = principal.getName(); // 사용자(관리자)정보 가져오기
	    
	    mv.addObject("username", username);
		return mv;
	}
	
	// 자주묻는질문 작성
	@PostMapping("/faq/write")
	public ModelAndView faqwrite(
			ModelAndView mv
		  , AdminFaqVo vo
			) {
		service.insertFaqWrite(vo);
		mv.setViewName("redirect:/admin/faq/list");
		return mv;
	}
	
	
	// 자주묻는질문 수정 페이지로 이동
	@GetMapping("/faq/update/{faqNo}")
	public ModelAndView viewUpdateFaq(
			ModelAndView mv
		  , @PathVariable int faqNo
			) {
		AdminFaqVo result = service.selectFaqDetail(faqNo);
		mv.addObject("faqlist", result); // 기존 내용 띄우기
		mv.setViewName("admin/faq/update");
		return mv;
	}
	
	
	// 자주묻는질문 수정하기
	@PostMapping("/faq/update/{faqNo}") // 왜 url이 두개나오는거지??(faqupdate.jsp) 해결중!!!!!!!!!
	public ModelAndView selectFaqModify(
		     ModelAndView mv
		   , @PathVariable int faqNo
		   , AdminFaqVo vo) {
		service.selectFaqModify(vo);
		mv.setViewName("redirect:/admin/faq/detail/"+vo.getFaqNo());
		return mv;
	}
	
	// 자주묻는질문 삭제하기
	@GetMapping("/faq/delete/{faqNo}")
	public ModelAndView deleteFaq(
			  ModelAndView mv
			, @PathVariable int faqNo
			) {
		service.deleteFaq(faqNo);
		mv.setViewName("redirect:/admin/faq/list");
		return mv;
	}
	
	// 문의내역 리스트
	@RequestMapping(value = "qna/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectQnaList(
			ModelAndView mv
			, AdminQnaMngtVo vo
			) {
	    if(vo.getSearchOption() == null) {
	        mv.addObject("qnalist", service.selectQnaList()); // 검색이 없는경우
	    } else {
	        mv.addObject("qnalist", service.selectSearchQnaList(vo)); // 검색이 있을경우    
	        mv.addObject("searchOption", vo.getSearchOption());
	        mv.addObject("searchBox", vo.getSearchBox());
	    }
		mv.setViewName("admin/qna/list");
		return mv;
	}
	
	// 문의내역 상세보기
	@GetMapping("/qna/detail/{aqNo}")
	public ModelAndView selectQnaListDetail(
			ModelAndView mv
			, @PathVariable int aqNo
			, AdminQnaMngtVo vo
			, Principal principal // 사용자(관리자)정보 가져오기
			, HttpServletRequest request
			, HttpServletResponse response
			) {
	    String username = principal.getName(); // 사용자(관리자)정보 가져오기
	    AdminQnaMngtVo qnaDetail = service.selectQnaListDetail(aqNo);
	    mv.addObject("qnaAnsList", service.selectQnaAnsList(aqNo));
	    mv.addObject("username", username);
	    mv.addObject("aqNo", aqNo);
				
		Cookie[] cookies = request.getCookies(); 
		
		Cookie viewCookie = null;
		
		if(cookies !=null && cookies.length > 0) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("cookie"+aqNo)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴."); 
					viewCookie = cookies[i]; 		
				}
			}
		}
	
       if (qnaDetail != null) {
    		mv.addObject("qnaDetail", qnaDetail);
 
            if (viewCookie == null) {    
                System.out.println("cookie 없음");
                
                Cookie newCookie = new Cookie("cookie" + aqNo , "|" + aqNo + "|");
                newCookie.setMaxAge(10);
                                
                response.addCookie(newCookie);
 
                int result = service.viewUp(aqNo);
                
                if(result>0) {
                    System.out.println("조회수 증가");
                }else {
                    System.out.println("조회수 증가 에러");
                }
            }
            
            else {
                System.out.println("cookie 있음");
                
                String value = viewCookie.getValue();
                
                System.out.println("cookie 값 : " + value);
        
            }
            
            // 상세페이지로 이동
    		mv.setViewName("admin/qna/detail");
    		return mv;
        } 
        else {
//            // 에러 페이지 설정
//            view.setViewName("error/reviewError");
//            return view;
        }
	return mv;
    }
	
	// 문의 답변 작성 ajax
	@ResponseBody
	@PostMapping("/qna/insertAns")
	public String insertQnaAnsWrite(
			 AdminQnaAnsVo vo
			) {
		int result = service.insertQnaAnsWrite(vo);
		userService.upAnswers(vo.getAqNo());
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 문의내역 답변 불러오기 ajax
	@ResponseBody
	@PostMapping(value="/qna/ansList", produces = "application/json;charset=utf-8")
	public String ansList(
			@RequestParam("aqNo") int aqNo)
			{
			service.selectQnaListDetail(aqNo);
			List<AdminQnaAnsVo> qnaAnsList = service.selectQnaAnsList(aqNo);
			if(!qnaAnsList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				return gson.toJson(qnaAnsList);
			}
			return null;
	}
	
	// 문의 답변 삭제 ajax
	@ResponseBody
	@PostMapping("/qna/deleteAns")
	public String deleteQnaAns(
			 int aaNo
			) {
		userService.deAnswers(userService.getAnsByNo(aaNo).getAqNo());
		int result = service.deleteQnaAns(aaNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 문의 답변 수정
	@ResponseBody
	@PostMapping("/qna/updateAns")
	public String updateQnaAns(
			AdminQnaAnsVo vo
			) {
		int result = service.updateQnaAns(vo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 답글 불러오기
	@ResponseBody
	@PostMapping(value = "/qna/qnaReplyList" , produces = "application/json;charset=utf-8")
	public String selectQnaReplyList(
			@RequestParam("aaNo")int aaNo
			) {
		List<AdminQnaReplyVo> qnaReplyList = service.selectQnaReplyList(aaNo);
		if(!qnaReplyList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(qnaReplyList);
		}
		return null;
	}
	
	// 문의 내역 답글 등록 ajax
	@ResponseBody
	@PostMapping("/qna/insertReply")
	public String insertReply(
			 AdminQnaReplyVo vo
			) {
		int result = service.insertReply(vo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 문의 내역 답글 수정 ajax
	@ResponseBody
	@PostMapping("/qna/updateReply")
	public String updateQnaReply(
			AdminQnaReplyVo vo
			) {
		int result = service.updateQnaReply(vo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 문의 답글 삭제 ajax
	@ResponseBody
	@PostMapping("/qna/deleteReply")
	public String deleteQnaReply(
			@RequestParam("rplNo") int rplNo
			) {
		int result = service.deleteQnaReply(rplNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 답변수 ajax
	@ResponseBody
	@PostMapping("/qna/selectAnswerCount")
	public int selectAnswerCount(
			@RequestParam("aqNo") int aqNo
			) {
		int result = service.selectAnswerCount(aqNo);
			return result;		
	}
	
	// 조회수 조회 ajax
	@ResponseBody
	@PostMapping("/qna/selectViewCount")
	public int selectViewCount(@RequestParam("aqNo") int aqNo) {
		int result = service.selectViewCount(aqNo);
		return result;
	}
}

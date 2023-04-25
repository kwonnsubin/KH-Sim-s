package kh.finalproject.sims.admin.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminUserMngtService;
import kh.finalproject.sims.admin.model.vo.AdminUserMngtVo;
import kh.finalproject.sims.common.page.Search;


@RequestMapping("/admin")
@Controller
public class AdminUserMngtController {
	
	@Autowired
	private AdminUserMngtService service;
	
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
	
	//관리자의 사용자 관리 리스트로 이동
	@RequestMapping(value="/userList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectUserList(ModelAndView mv, AdminUserMngtVo vo, @RequestParam(value="p", required = false)String pageNumber, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> paginationInfo = paginationInfo(pageNumber, request, response);
		int pNum = Integer.parseInt(paginationInfo.get("pNum"));
		int cnt = Integer.parseInt(paginationInfo.get("cnt"));
		String searchUserId = vo.getSearchUserId();
		String searchUserName = vo.getSearchUserName();
		String searchRadioVal = vo.getSearchRadioVal();
		Search search = service.selectUserList(pNum, cnt, searchUserId,searchUserName, searchRadioVal);
		request.setAttribute("paging", search);
		mv.addObject("searchUserId", vo.getSearchUserId());
		mv.addObject("searchUserName", vo.getSearchUserName());
		mv.addObject("searchRadioVal", vo.getSearchRadioVal());
		mv.setViewName("admin/user/userList");
		return mv;
	}
	
	//관리자의 사용자 관리 상세 페이지로 이동
	@GetMapping("/userDetail/{userId}")
	public ModelAndView selectUserDetail(ModelAndView mv, @PathVariable String userId) {
		AdminUserMngtVo userDetail = service.selectUserDetail(userId);
		mv.addObject("userDetail", userDetail);
		mv.setViewName("admin/user/userDetail");
		mv.addObject("cmd","read");
		return mv;
	}
	
	//관리자의 사용자 관리 수정 페이지로 이동
	@GetMapping("/selectUserModify/{userId}")
	public ModelAndView selectUserModify(
			ModelAndView mv
			, @PathVariable String userId
			, AdminUserMngtVo vo) {
		AdminUserMngtVo userDetail = service.selectUserDetail(userId);
		mv.addObject("userDetail", userDetail);
		mv.addObject("cmd","update");
		mv.setViewName("/admin/user/userDetail");
		return mv;
	}
		
	//관리자의 사용자 관리 수정하기
	@PostMapping("/saveUserModify")
	public ModelAndView saveUserModify(
			ModelAndView mv
		  , AdminUserMngtVo vo) {
		  service.saveUserModify(vo);
		  
		  String userId = vo.getUserId();
		  AdminUserMngtVo userDetail = service.selectUserDetail(userId);
		  mv.addObject("userDetail", userDetail);
		  mv.addObject("result", "저장이 완료되었습니다.");
		  mv.addObject("cmd","read");
		  mv.setViewName("/admin/user/userDetail");
		  return mv;
	}
			
			
			

}

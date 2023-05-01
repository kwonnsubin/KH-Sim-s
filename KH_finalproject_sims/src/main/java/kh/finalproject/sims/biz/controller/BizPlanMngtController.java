package kh.finalproject.sims.biz.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizPlanMngtService;
import kh.finalproject.sims.biz.model.vo.BizPlanMngtVo;
import kh.finalproject.sims.common.page.Paging;
import kh.finalproject.sims.common.page.Search;
import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
@RequestMapping("/biz")
public class BizPlanMngtController {

	@Autowired
	private BizPlanMngtService service;

	//search 요금제 목록
	@GetMapping("/planList")
	public ModelAndView searchBizPlanList(ModelAndView mv
			, Principal principal
			,@RequestParam(required = false) String keyword
			, HttpServletRequest request
			, HttpServletResponse response
			) {
		String bizid = principal.getName();
		System.out.println("통신사아이디 : " + bizid);
		
		int searchListCnt = service.getSearchPlanListCount(bizid, keyword);
		System.out.println("요금제 목록 개수는 : " + searchListCnt);
	
		mv.addObject("vo", searchListCnt);
		
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
		
		Search search = service.getPage(bizid, pNum, Integer.parseInt(cnt), keyword);
		request.setAttribute("paging", search);
		System.out.println("@@@@search.getPage() : " +search.getPage());//확인용
		
		//이름 고정용
		BizPlanMngtVo bizName = service.findByBizName(bizid); //String으로 빼도 되는데 밑에 detail 작업 때문에.. 
		System.out.println(bizName);

		mv.addObject("bizName", bizName);
		
		mv.setViewName("/biz/planList");
		return mv;
}
	

	// 통신사 요금제 상세
	@GetMapping("/planDetail")
	public ModelAndView selectBizPlanDetail(ModelAndView mv, int planNo) {
		System.out.println(planNo);
		BizPlanMngtVo vo = service.selectBizPlanDetail(planNo); // 이름으로 보내면 요금제 이름이 중복 될 경우에 에러 나서 planNo로
		System.out.println(vo);

		mv.addObject("planDetail", vo);
		mv.setViewName("/biz/planDetail");
		return mv;
	}

	// 통신사 요금제 등록
	@GetMapping("/registerPlan")
	public ModelAndView registerBizPlan(ModelAndView mv
			, Principal principal
			) {

		String bizid = principal.getName();
		System.out.println("통신사아이디 : " + bizid);

		BizPlanMngtVo vo = service.findByBizName(bizid);
		System.out.println(vo);

		mv.addObject("vo", vo);
		mv.setViewName("/biz/registerPlan");
		return mv;
	}

	@PostMapping("/registerPlan")
	public String registerBizPlan(ModelAndView mv
			, @ModelAttribute BizPlanMngtVo vo
			) {
		service.registerBizPlan(vo);

		return "redirect:/biz/planList";
	}
	
	//요금제 삭제
	@PostMapping("deletePlan")
	@ResponseBody
	public String deleteBizPlan(int planNo) {
		System.out.println(planNo);
		service.deleteBizPlan(planNo);
		return "success";
	}
	
	//체크박스를 통한 요금제 선택삭제
	@PostMapping("deleteChkBox")
	public String deleteChkBox(HttpServletRequest req) {
		String [] ajaxMsg = req.getParameterValues("valueArr");
		
		if(ajaxMsg !=null && ajaxMsg.length > 0) {
            for(int i=0; i<ajaxMsg.length; i++) {
               System.out.println("ajax traditional result : " + i +" : "+ ajaxMsg[i]);
       	    }
		} // ajax traditional result : 0 : 201
		
		System.out.println("ajaxMsg : " + ajaxMsg); 
		// ajaxMsg : [Ljava.lang.String;@5d59e93b
		
		int [] ajaxMsgInt = new int[ajaxMsg.length]; //String 배열을 int 배열로 변환
		for (int i = 0; i < ajaxMsg.length; i++) {
			ajaxMsgInt[i] = Integer.parseInt(ajaxMsg[i]);
        }
		
		for (int i = 0; i <ajaxMsg.length; i++ ) {
			service.deleteBizPlan(ajaxMsgInt[i]); 
		}
		
		return  "redirect:/biz/planList"; //리다이렉트로 리턴해야 에러 안남. 
	}
	
	//요금제 수정(기본값 출력용)
	@GetMapping("/modifyPlan")
	public ModelAndView modifyPlan(ModelAndView mv
			, int planNo
			) {
		System.out.println("요금제 수정을 위한 기본값 출력 planNo:"+ planNo);
		BizPlanMngtVo vo = service.selectBizPlanDetail(planNo);
		System.out.println("요금제 수정을 위한 기본값 출력 vo :"+ vo);

		mv.addObject("planDetail", vo);
		mv.setViewName("/biz/planDetail");
		
		mv.setViewName("/biz/planModify");
		return mv;
	}
	
	
	//요금제 수정
	@PostMapping("/modifyPlan")
	public String modifyPlan(@ModelAttribute BizPlanMngtVo vo
			) {
		System.out.println("post로 넘어온planNo :"+vo.getPlanNo());
		System.out.println("수정 정보 vo :" +vo);
		
		service.modifyPlan(vo);
		
		return "redirect:/biz/planDetail?planNo="+vo.getPlanNo();
	}
}
	


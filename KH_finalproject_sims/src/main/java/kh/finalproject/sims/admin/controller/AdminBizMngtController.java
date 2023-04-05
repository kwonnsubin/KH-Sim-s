package kh.finalproject.sims.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminBizMngtService;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;


@RequestMapping("/admin")
@Controller
public class AdminBizMngtController {
	
	@Autowired
	private AdminBizMngtService service;
	
	//통신사 리스트로 이동
	@RequestMapping(value="/applyList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectApplyList(ModelAndView mv, AdminBizMngtVo vo) {
		mv.addObject("applyList", service.selectApplyList(vo));
		mv.addObject("searchOption", vo.getSearchOption());
		mv.addObject("searchBox", vo.getSearchBox());
		mv.setViewName("admin/biz/applyList");
		return mv;
	}

	//통신사 신청정보 상세 페이지로 이동
	@GetMapping("/applyDetail/{bizId}")
	public ModelAndView selectApplyDetail(ModelAndView mv, @PathVariable String bizId, HttpServletRequest request, AdminBizMngtVo vo) {
		String divCheck = request.getParameter("divCheck");
		switch(divCheck) {
			case "apply": mv.setViewName("admin/biz/applyDetail");
				break;
			case "detail": mv.setViewName("admin/biz/bizDetail");
				mv.addObject("bizPlanList", service.selectBizPlanList(bizId));
				break;
			default: mv.setViewName("admin/biz/bizDetail");
				mv.addObject("bizPlanList", service.selectBizPlanList(bizId));
				break;
		}
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("cmd", "read");
		return mv;
	}
	
	//통신사 상세 수정 페이지로 이동
	@GetMapping("/selectBizModify/{bizId}")
	public ModelAndView selectBizModify(
			ModelAndView mv
			, @PathVariable String bizId
			, AdminBizMngtVo vo) {
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		mv.addObject("applyDetail", applyDetail);
		mv.addObject("cmd", "update");
		mv.setViewName("/admin/biz/bizDetail");
		return mv;
	}
	
	//통신사 상세 수정하기
	@PostMapping("/saveBizModify")
	public ModelAndView saveBizModify(
			ModelAndView mv
			, AdminBizMngtVo vo) {
			service.saveBizModify(vo);
			
			String bizId = vo.getBizId();
			AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
			mv.addObject("applyDetail", applyDetail);
			mv.addObject("result", "수정이 완료되었습니다.");
			mv.addObject("cmd", "read");
			mv.setViewName("admin/biz/bizDetail");
			return mv;
	}
	
	
	//통신사 탈퇴 리스트로 이동
	@RequestMapping(value="/withdrawalList", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectWithdrawalList(ModelAndView mv, AdminBizMngtVo vo) {
		mv.addObject("withdrawalList", service.selectWithdrawalList(vo));
		mv.addObject("searchOption", vo.getSearchOption());
		mv.addObject("searchBox", vo.getSearchBox());
		mv.setViewName("admin/biz/withdrawalList");
		mv.addObject("cmd", "read");
		return mv;
	
	}
	
	//통신사 탈퇴 상세 정보로 이동
	@GetMapping("/withdrawalDetail/{bizId}")
	public ModelAndView selectWithdrawalDetail(ModelAndView mv, @PathVariable String bizId) {
		AdminBizMngtVo withdrawalDetail = service.selectWithdrawalDetail(bizId);
		mv.addObject("withdrawalDetail", withdrawalDetail);
		mv.setViewName("admin/biz/withdrawalDetail");
		mv.addObject("cmd", "read");
		return mv;
	}	
	
	//통신사 요금제 개통 신청 리스트로 이동
	@RequestMapping(value="/bizPlanApplyList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectBizPlanApplyList(ModelAndView mv, AdminBizMngtVo vo) {
		mv.addObject("bizPlanApplyList", service.selectBizPlanApplyList(vo));
		mv.addObject("searchOption", vo.getSearchOption());
		mv.addObject("searchBox", vo.getSearchBox());
		mv.setViewName("admin/biz/planApplyList");
		mv.addObject("cmd", "read");
		return mv;
	}
	
	//통신사 요금제 개통 신청 상세 페이지로 이동
	@GetMapping("/bizPlanApplyDetail/{orderNo}")
	public ModelAndView selectBizPlanApplyDetail(ModelAndView mv, @PathVariable int orderNo) {
		AdminBizMngtVo bizPlanApplyDetail = service.selectBizPlanApplyDetail(orderNo);
		mv.addObject("bizPlanApplyDetail", bizPlanApplyDetail);
		mv.setViewName("admin/biz/planApplyDetail");
		mv.addObject("cmd", "read");
		return mv;
	}
	
	
}

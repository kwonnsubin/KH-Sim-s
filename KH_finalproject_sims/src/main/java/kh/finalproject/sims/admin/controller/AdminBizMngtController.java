package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.admin.model.service.AdminBizMngtService;
import kh.finalproject.sims.admin.model.vo.AdminBizMngtVo;

@RequestMapping("/adminBiz")
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
	public ModelAndView selectApplyDetail(ModelAndView mv, @PathVariable String bizId) {
		AdminBizMngtVo applyDetail = service.selectApplyDetail(bizId);
		mv.addObject("applyDetail", applyDetail);
		mv.setViewName("admin/biz/applyDetail");
		mv.addObject("cmd", "read");
		return mv;
	}
	
	//통신사 상세 페이지로 이동
	@GetMapping("/bizDetail/{bizOwnerName}")
	public ModelAndView selectBizDetail(ModelAndView mv, @PathVariable String bizOwnerName) {
		AdminBizMngtVo bizDetail = service.selectBizDetail(bizOwnerName);
		mv.addObject("bizDetail", bizDetail);
		mv.setViewName("admin/biz/bizDetail");
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
	
	
}

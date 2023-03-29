package kh.finalproject.sims.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	//통신사 신청정보 리스트로 이동 (가입신청)
	@RequestMapping(value="/bizApplyList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectApplyList(ModelAndView mv, AdminBizMngtVo vo) {
		mv.addObject("bizApplyList", service.selectBizApplyList(vo));
		mv.addObject("searchOption", vo.getSearchOption());
		mv.addObject("searchBox", vo.getSearchBox());
		mv.setViewName("admin/biz/applyList");
		return mv;
	}

}

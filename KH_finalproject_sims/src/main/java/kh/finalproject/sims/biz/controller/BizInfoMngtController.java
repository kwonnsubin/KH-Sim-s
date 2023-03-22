package kh.finalproject.sims.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizInfoMngtService;
import kh.finalproject.sims.biz.model.vo.BizInfoMngtVo;

@Controller
@RequestMapping("/biz")
public class BizInfoMngtController {
	
	@Autowired
	private BizInfoMngtService service;
	
	@GetMapping("/infodetail")
	public ModelAndView selectBizInfoDetail(ModelAndView mv) throws Exception {
		mv.addObject("info", service.selectList());
		mv.setViewName("biz/info");
		
		return mv;
	}

}

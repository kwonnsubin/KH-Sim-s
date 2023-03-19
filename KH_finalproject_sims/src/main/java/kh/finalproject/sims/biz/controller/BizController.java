package kh.finalproject.sims.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.biz.model.service.BizService;
import kh.finalproject.sims.biz.model.vo.BizVo;

@Controller
@RequestMapping("/biz")
public class BizController {
	
	@Autowired
	private BizService service;
	
	@GetMapping("/list")
	public ModelAndView tempGet(ModelAndView mv) throws Exception {
		//List<BizVo> result = service.selectList();
		//System.out.println("result :" + result);
		mv.addObject("list", service.selectList());
		mv.setViewName("biz/list");
		
		return mv;
	}

}

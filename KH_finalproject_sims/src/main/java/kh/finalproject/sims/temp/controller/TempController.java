package kh.finalproject.sims.temp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.temp.model.service.TempService;
import kh.finalproject.sims.temp.model.vo.TempVo;

@Controller
@RequestMapping("/temp")
public class TempController {

	@Autowired
	private TempService service;
	
	@GetMapping("/list")
	public ModelAndView tempGet(ModelAndView mv) throws Exception {
		List<TempVo> result = service.selectList();
		mv.addObject("list", result);
		mv.setViewName("list");
		
		return mv;
	}
	
	@PostMapping("/test")
	public ModelAndView tempPost(ModelAndView mv) {
		
		return mv;
	}
	
}

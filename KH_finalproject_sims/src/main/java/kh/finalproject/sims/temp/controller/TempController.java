package kh.finalproject.sims.temp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.temp.model.service.TempService;

@Controller
@RequestMapping("/temp")
public class TempController {

	@Autowired
	private TempService service;
	
	@GetMapping("/test")
	public ModelAndView tempGet(ModelAndView mv) {
		
		return mv;
	}
	
	@PostMapping("/test")
	public ModelAndView tempPost(ModelAndView mv) {
		
		return mv;
	}
	
}

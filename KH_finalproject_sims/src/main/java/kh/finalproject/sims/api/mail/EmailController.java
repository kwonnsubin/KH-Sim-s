package kh.finalproject.sims.api.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {
	
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping(value = "/mail")
	public ModelAndView mailCheck(ModelAndView mv) {
		
		mv.setViewName("apitest/mail");
		return mv;
	}
	
	//이메일 인증
	@RequestMapping(value = "/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}

}

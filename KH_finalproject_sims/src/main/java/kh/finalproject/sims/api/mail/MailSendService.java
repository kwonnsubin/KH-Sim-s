package kh.finalproject.sims.api.mail;

import org.springframework.stereotype.Component;

public interface MailSendService {
	
	public void makeRandomNumber();
	
	public String joinEmail(String email);
	
	public void mailSend(String setFrom, String toMail, String title, String content);

}

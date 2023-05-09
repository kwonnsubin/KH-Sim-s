package kh.finalproject.sims.api.mail;

import org.springframework.stereotype.Component;

public interface MailSendService {
	
	public void makeRandomNumber() throws Exception;
	
	public String joinEmail(String email) throws Exception;
	
	public void mailSend(String setFrom, String toMail, String title, String content) throws Exception;

}

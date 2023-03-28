package kh.finalproject.sims.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String handlerException(Exception e) {
		System.out.println("에러 발생, exceptionHandler 작동");
		return e.getMessage();
	}

}

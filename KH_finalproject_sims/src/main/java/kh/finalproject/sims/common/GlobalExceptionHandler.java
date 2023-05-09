package kh.finalproject.sims.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String handlerException(Exception e) {
		System.out.println("에러 발생, exceptionHandler 작동");
		System.out.println("error 코드 : " + e);
		return "error/404error";
	}
	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	public String handlerException(NoHandlerFoundException e) {
//		System.out.println("404에러 발생, exceptionHandler 작동");
//		System.out.println("error 코드 : " + e);
//		return "error/404error";
//	}
//	
//	@ExceptionHandler(NullPointerException.class)
//	public String handlerException(NullPointerException e) {
//		System.out.println("500에러 발생, exceptionHandler 작동");
//		System.out.println("error 코드 : " + e);
//		return "error/500error";
//	}

}

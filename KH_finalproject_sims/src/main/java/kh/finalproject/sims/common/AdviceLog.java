package kh.finalproject.sims.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AdviceLog {
	
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	// * 1개 이상이 존재함
	// .. 0개 이상이 존재함
	@Pointcut("execution(public * kh.finalproject.sims..*Controller.*(..))")
	public void controllerPointCut() { }
	// 위 pointcut의 이름은 "controllerPointCut()"	
	
	@Pointcut("execution(public * kh.finalproject.sims..*Dao.*(..))")
	public void daoPointCut() { }
	
	@Pointcut("execution(public * kh.finalproject.sims..*ServiceImpl.*(..))")
	public void serviceImplPointCut() { }
	
	@Around("controllerPointCut()")
	public Object aroundControllerPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj = null;
		
		// pjp.getThis() 클래스명
		// pjp.getSignature().getName() 메소드명
		logger.info("▶Ctrl: " + pjp.getThis() + " " + pjp.getSignature().getName());
		
		Object[] args = pjp.getArgs();
		
		for(int i = 0; i < args.length; i++) {
			logger.info("▶args[" + i + "] : " + args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		// 타겟 메소드 실행
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶Ctrl Return[" + stopwatch.getTotalTimeMillis() + "] : " + returnObj);
		return returnObj;
	}
	
	@Around("daoPointCut()")
	public Object aroundDaoPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj = null;
		
		logger.info("▶Dao: " + pjp.getThis() + " " + pjp.getSignature().getName());
		
		Object[] args = pjp.getArgs();
		
		for(int i = 0; i < args.length; i++) {
			logger.info("▶▶▶args[" + i + "] : " + args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶▶▶DAO Return[" + stopwatch.getTotalTimeMillis() + "] : " + returnObj);
		
		return returnObj;
	}
	
	@Around("serviceImplPointCut()")
	public Object aroundServiceImplPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj = null;
		
		logger.info("▶Srvc: " + pjp.getThis() + " " + pjp.getSignature().getName());
		
		Object[] args = pjp.getArgs();
		
		for(int i = 0; i < args.length; i++) {
			logger.info("▶▶args[" + i + "] : " + args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶▶Srvc Return[" + stopwatch.getTotalTimeMillis() + "] : " + returnObj);
		
		return returnObj;
	}
}

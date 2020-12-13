package com.mynote.app.main;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AopTest {
	
	
	@Around("execution(* com.mynote.app..*.practiceService.*(..))")
	public Object test(ProceedingJoinPoint join)throws Exception {
		Object test = new Object();
		
		try {
			test =join.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return test;
		
	}

}

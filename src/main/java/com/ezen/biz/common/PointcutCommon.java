package com.ezen.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect //aop관련된 기능
public class PointcutCommon {

	@Pointcut("execution(* com.ezen.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.ezen.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	
}

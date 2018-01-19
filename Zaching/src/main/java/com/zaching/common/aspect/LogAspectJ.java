package com.zaching.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

/*
 * FileName : PojoAspectJ.java
 *	:: XML 에 선언적으로 aspect 의 적용   
  */
public class LogAspectJ {

	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
		
		System.out.println("[ before ] : "+joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length !=0){
			System.out.println(" parameter : "+ joinPoint.getArgs()[0]);
		}
		//==> 타겟 객체의 Method 를 호출 하는 부분 
		Object obj = joinPoint.proceed();

		System.out.println("[ after ] : " +joinPoint.getSignature().getName()+" : "+obj+"\n");
		
		return obj;
	}
	
}//end of class
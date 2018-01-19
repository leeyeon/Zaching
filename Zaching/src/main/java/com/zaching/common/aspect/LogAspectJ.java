package com.zaching.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

/*
 * FileName : PojoAspectJ.java
 *	:: XML �� ���������� aspect �� ����   
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
		//==> Ÿ�� ��ü�� Method �� ȣ�� �ϴ� �κ� 
		Object obj = joinPoint.proceed();

		System.out.println("[ after ] : " +joinPoint.getSignature().getName()+" : "+obj+"\n");
		
		return obj;
	}
	
}//end of class
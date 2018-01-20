package com.zaching.service.payment;

public interface PaymentRestDao {
	
	/* 카카오페이 */
	
	public boolean addPoint(int userId, int point) throws Exception;
	
}

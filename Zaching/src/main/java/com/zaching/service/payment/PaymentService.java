package com.zaching.service.payment;

import java.util.Map;

import com.zaching.service.domain.User;

public interface PaymentService {

	public Map<String, Object> listPoint(int userId) throws Exception;
	
	public void exchargePoint(User user) throws Exception;
	
	public void chargePoint(int userId) throws Exception;

	public void presentPoint(int userId, int targetId) throws Exception;
	
	public void addMileage(int userId) throws Exception;
	
	public void useMileage(int userId, int mileage) throws Exception;
	
	public int getTotalPoint(int userId) throws Exception;
	
	public int getMileage(int userId) throws Exception;
}

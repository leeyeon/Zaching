package com.zaching.service.payment;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.User;

public interface PaymentDao {
	
	public List<Payment> listPoint(int userId) throws Exception;
	
	public void exchargePoint(User user) throws Exception;
	
	public void chargePoint(int userId) throws Exception;
	
	public int getPoint(int userId) throws Exception;
	
	public void addMileage(int userId) throws Exception;
	
	public void useMileage(int userId, int mileage) throws Exception;
	
	public int getTotalPoint(int userId) throws Exception;
	
	public int getMileage(int userId) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;

}

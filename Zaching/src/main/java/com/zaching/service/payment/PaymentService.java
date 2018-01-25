package com.zaching.service.payment;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;

public interface PaymentService {

	public List<Payment> listPoint(Search search, int userId) throws Exception;

	public List<Payment> listExchargePoint(Search search) throws Exception;
	
	public void managePoint(Payment payment) throws Exception;
	
	public void manageMileage(Payment payment) throws Exception;

	public void presentPoint(Payment payment) throws Exception;
	
	public int getPoint(int userId) throws Exception;
	
	public int getMileage(int userId) throws Exception;
}

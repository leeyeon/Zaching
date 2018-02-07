package com.zaching.service.payment;

import java.util.List;

import org.json.simple.JSONObject;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;

public interface PaymentDao {
	
	public List<Payment> listPoint(Search search, int userId) throws Exception;
	
	public List<Payment> listExchargePoint(Search search) throws Exception;
	
	public void managePayment(Payment payment) throws Exception;
	
	public void presentUserPayment(Payment payment) throws Exception;
	
	public void exchargePoint(Payment payment) throws Exception;

	public void updateUserPayment(Payment payment) throws Exception;
	
	public int getPayment(int userId, boolean isPoint) throws Exception;
	
	public String getAuthorizationUrl(int authType);
	
	public JSONObject getAccessToken(String code) throws Exception;
	
	public int getTotalCount(Search search, int userId) throws Exception;
	
	public String getUserCI(String accessToken, String userSeqNo) throws Exception;
}

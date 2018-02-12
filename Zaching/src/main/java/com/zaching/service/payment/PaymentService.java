package com.zaching.service.payment;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;

public interface PaymentService {

	public Map<String, Object> listPoint(Search search, int userId) throws Exception;

	public List<Payment> listExchargePoint(Search search) throws Exception;
	
	public void managePoint(Payment payment) throws Exception;
	
	public void manageMileage(Payment payment) throws Exception;

	public void presentPoint(Payment payment) throws Exception;
	
	public int getPoint(int userId) throws Exception;
	
	public int getMileage(int userId) throws Exception;
	
	public String getAuthorizationUrl(int authType) throws Exception;
	
	public String getAccessToken2() throws Exception;
	
	public JSONObject getAccessToken(String code) throws Exception;
	
	public String getUserCI(String accessToken, String userSeqNo) throws Exception;
	
	public Map<String, Object> getAccountRealName(String accessToken, String accountNum, int accountHolderinfo) throws Exception;
	
	public Map<String, Object> listBackCode() throws Exception;
}

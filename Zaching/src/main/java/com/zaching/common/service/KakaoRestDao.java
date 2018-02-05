package com.zaching.common.service;

import java.util.Map;

import org.json.simple.JSONObject;

public interface KakaoRestDao {
	
	public String getAuthorizationUrl();
	
	public String getAuthorizationUrl_login();
	
	public Map<String, Object> getAceessToken(String code) throws Exception;
	
	public String getAceessToken2(String code) throws Exception;
	
	public String getPaymentReady(String token, int point) throws Exception;
	
	public String getPaymentReady(int point) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String pgToken) throws Exception;
}

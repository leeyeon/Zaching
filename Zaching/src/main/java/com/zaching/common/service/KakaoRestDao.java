package com.zaching.common.service;

import java.util.Map;

import org.json.simple.JSONObject;

import com.zaching.service.domain.User;

public interface KakaoRestDao {
	
	public String getAuthorizationUrl();
	
	public String getAuthorizationUrl_login();
	
	public Map<String, Object> getAceessToken(String code) throws Exception;
	
	public User getAceessToken2(String code) throws Exception;
	
	public String getPaymentReady(String token, int point) throws Exception;
	
	public String getPaymentReady(int point) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String pgToken) throws Exception;
	
	public void getAppConnection(String token)throws Exception; //앱연결
	
	public User getUserInfo(User user)throws Exception;//사용자 정보 받기
}

package com.zaching.service.payment;

import org.json.simple.JSONObject;

import com.zaching.common.URLConnection;

public class KFTC {
	
	private final static String CLIENT_ID = "l7xx9cd7e927676141669b16e83b062087a2";
	private final static String CLIENT_SECRET = "c4975689d0174c6c9f6dfd5f11c60e3a";
	
	private final static String REDIRECT_URI = "http://127.0.0.1:8080/payment/oauthAccount";
	private final static String GET_TOKEN_API_URI = "https://testapi.open-platform.or.kr/oauth/2.0/token";
	private final static String REAL_NAME_URI = "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name";
	private final static String USER_ME_URI = "https://testapi.open-platform.or.kr/user/me";
	
	public KFTC() {
		// TODO Auto-generated constructor stub
	}
	
	/* getAuthorizationUrl  */
	public String getAuthorizationUrl(int authType) {

		String url = "redirect:https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id="+CLIENT_ID
				+"&redirect_uri="+REDIRECT_URI+"&scope=login inquiry&client_info=zaching&auth_type="+authType;

		System.out.println(url);
		
		return url;
	}
	
	public JSONObject getAccessToken(String code) throws Exception {
		
		System.out.println("getAccessToken()");
		
		String param = "code="+code+"&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET
				+"&redirect_uri="+REDIRECT_URI+"&grant_type=authorization_code";
		
		System.out.println(GET_TOKEN_API_URI+"?"+param);
		
		JSONObject obj = URLConnection.getJSON_PARAM("POST", GET_TOKEN_API_URI, param, 
				"application/x-www-form-urlencoded;charset=UTF-8");
		
		String access_token = obj.get("access_token").toString();
		String user_seq_no = obj.get("user_seq_no").toString();
		
		System.out.println("토큰 :: "+access_token);
		
		// seq_no DB?뿉 ???옣
		System.out.println("시큐얼 :: "+user_seq_no);
		
		return obj;
	}
	
	/*
	public String getRealName(String accessToken, String bankCode, String accountNum, String accountHolderInfo,
			String tranDtime) throws Exception {
		
		System.out.println("getRealName()");
		
		String param = "bank_code_std="+bankCode+"&account_num="+accountNum
				+"&account_holder_info="+accountHolderInfo+"&tran_dtime="+tranDtime;
		
		JSONObject obj = JSON.getJSON_PARAM("POST", REAL_NAME_URI, param, 
				"application/json; charset=UTF-8", "Authorization", "Bearer "+accessToken);
		
		String bankName = obj.get("bank_name").toString();
		String accountHodlerName = obj.get("account_holder_name").toString();
		
		return accountHodlerName+"/"+accountHolderInfo+"/"+bankName+"/"+accountNum;
		
	}
	*/

	public String getUserCI(String accessToken, String userSeqNo) throws Exception {
		
		System.out.println("getUserMe()");
		
		String param = "user_seq_no="+userSeqNo;
		
		JSONObject obj = URLConnection.getJSON_PARAM("GET", USER_ME_URI, param, 
				"application/x-www-form-urlencoded; charset=UTF-8", "Authorization", "Bearer "+accessToken);
		
		return obj.get("user_ci").toString();
	}

}

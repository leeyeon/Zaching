package com.zaching.common.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.zaching.common.URLConnection;
import com.zaching.common.service.KakaoRestDao;
import com.zaching.service.domain.User;

@Repository("kakaoRestDaoImpl")
public class KakaoRestDaoImpl implements KakaoRestDao {
	
	private final String REST_API_KEY = "90d9379d1246c1e7e36d34027d2e497d";
	private final String ADMIN_KEY = "3639f373825926cf896298541090d7a2";
	private final String REDIRECT_URI_Login = "http://127.0.0.1:8080/kakaoLogin";
	private final String REDIRECT_URI = "http://127.0.0.1:8080/payment/kakaoPay";
	private final String GET_TOKEN_API_URL = "https://kauth.kakao.com/oauth/token";

	private final String PAYMENT_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
	private final String PAYMENT_APPROVE_URL = "https://kapi.kakao.com//v1/payment/approve";
	
	private final String APP_CONNECTION_URL = "https://kapi.kakao.com/v1/user/signup";//앱연결
	private final String USER_INFO_URL = "https://kapi.kakao.com/v1/user/me";//사용자정보 받아오는 URL
	
	private final String PAYMENT_TEST_PARAM = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id";
	
	private static String accessToken;
	private static String refreshToken;
	
	private String tid;
	
	private JSONParser parser;
	
	public KakaoRestDaoImpl() {
		this.parser = new JSONParser();
	}

	@Override
	public String getAuthorizationUrl() {
		String url = "redirect:https://kauth.kakao.com/oauth/authorize?client_id="+this.REST_API_KEY
				+"&redirect_uri="+this.REDIRECT_URI_Login+"&response_type=code";
		
		return url;
	}
	

	@Override
	public Map<String, Object> getAceessToken(String code) throws Exception {
		
		System.out.println("KakaoR.getAccessToken()");
		
		String param = "grant_type=authorization_code&client_id="+REST_API_KEY
						+"&redirect_uri="+REDIRECT_URI+"&code="+code;

		JSONObject obj = 
				URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, GET_TOKEN_API_URL, param, "application/x-www-form-urlencoded");
        
        //System.out.println("access_token :: "+ obj.get("access_token"));

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accessToken", obj.get("access_token").toString());
        map.put("refreshToken", obj.get("refresh_token").toString());
        
        return map;
	}

	// accessToken 으로 카카오페이 준비
	@Override
	public String getPaymentReady(String token, int point) throws Exception {
		System.out.println("kakao.getPaymentReady()");

		String item = "point";
		int quantity = 1;

        String param = PAYMENT_TEST_PARAM+"&item_name="+item+"&quantity="+quantity+"&total_amount="+point
        				+ "&tax_free_amount=0&approval_url=http://127.0.0.1:8080/payment/kakaoPay/success"
        				+ "&fail_url=http://127.0.0.1:8080/payment/kakaoPay/fail&cancel_url=http://127.0.0.1:8080/payment/kakaoPay/cancel";
		
        JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_READY_URL, param,
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","Bearer "+token);

		this.tid = obj.get("tid").toString();
		
		return obj.get("next_redirect_pc_url").toString();
	}
	
	// adminKey 로 카카오페이 준비
	@Override
	public String getPaymentReady(int point) throws Exception {
		System.out.println("kakao.getPaymentReady()");

		String item = "point";
		int quantity = 1;

        String param = PAYMENT_TEST_PARAM+"&item_name="+item+"&quantity="+quantity+"&total_amount="+point
        				+ "&tax_free_amount=0&approval_url=http://127.0.0.1:8080/payment/kakaoPay/success"
        				+ "&fail_url=http://127.0.0.1:8080/payment/kakaoPay/fail&cancel_url=http://127.0.0.1:8080/payment/kakaoPay/cancel";
		
        //System.out.println(param);
        
        JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_READY_URL, param,
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","KakaoAK "+ADMIN_KEY);
		this.tid = obj.get("tid").toString();
		
		return obj.get("next_redirect_pc_url").toString();
	}

	@Override
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception {
		System.out.println("kakao.getPaymentApprove()");
        
        String param = PAYMENT_TEST_PARAM+"&tid="+tid+"&pg_token="+pgToken;
        
        //System.out.println(param);

		JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_APPROVE_URL, param, 
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","Bearer "+token);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approvedDate",(Date)obj.get("approved_at"));
		System.out.println("DATE :: "+(Date)obj.get("approved_at"));
		map.put("point", (int)((JSONObject)obj.get("amount")).get("total"));
		
		return map;
	}
	
	@Override
	public Map<String, Object> getPaymentApprove(String pgToken) throws Exception {
		System.out.println("kakao.getPaymentApprove()");
        
        String param = PAYMENT_TEST_PARAM+"&tid="+tid+"&pg_token="+pgToken;
        
        //System.out.println(param);

		JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_APPROVE_URL, param, 
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","KakaoAK "+ADMIN_KEY);

		Map<String, Object> map = new HashMap<String, Object>();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		Date date = transFormat.parse((String)obj.get("approved_at"));
		
		map.put("approvedDate",date);
		map.put("point", ((Long)((JSONObject)obj.get("amount")).get("total")).intValue());
		
		return map;
	}
	
	//카카오 로그인
	@Override
	public String getAuthorizationUrl_login(HttpSession session) {
		String url = "redirect:https://kauth.kakao.com/oauth/authorize?client_id="+this.REST_API_KEY
				+"&redirect_uri="+this.REDIRECT_URI_Login+"&response_type=code";
		
		
		
		return url;
	}
	
	//사용자 토큰 생성
	@Override
	public User getAceessToken2(String code,HttpSession session) throws Exception {
		
		System.out.println("KakaoR.getAccessToken()");
		
		String param = "grant_type=authorization_code&client_id="+REST_API_KEY
						+"&redirect_uri="+REDIRECT_URI_Login+"&code="+code;

		JSONObject obj = 
				URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, GET_TOKEN_API_URL, param,
						"application/x-www-form-urlencoded");
		 	
//			Map<String, Object> map = new HashMap<String, Object>();
//	        map.put("accessToken", obj.get("access_token").toString());
//	        map.put("refreshToken", obj.get("refresh_token").toString());
			
		 	User user = new User();
	        user.setAccessToken(obj.get("access_token").toString());
	        user.setRefreshToken(obj.get("refresh_token").toString());
	       
	        this.accessToken = obj.get("access_token").toString();
	        this.refreshToken = obj.get("refresh_token").toString();
	        
	        session.setAttribute("user", user);
	        
        return user;
	}


	//앱연결
	@Override
	public void getAppConnection(String token) throws Exception {
		
		System.out.println(":: KAKAO.getAppConnection() ::");
		
		JSONObject obj = URLConnection.getJSON(URLConnection.HTTPMETHOD_POST, 
				APP_CONNECTION_URL, "application/x-www-form-urlencoded;charset=utf-8",
				"Authorization", "Bearer"+token);
		System.out.println("App Connect response :: "+obj);		
	}
	
	//사용자 정보 받아오기
	@Override
	public User getUserInfo(User user) throws Exception {
		
		System.out.println("::KAKAO.getUserInfo() ::");
		
		JSONObject obj = URLConnection.getJSON(URLConnection.HTTPMETHOD_GET, USER_INFO_URL,
				"application/x-www-form-urlencoded;charset=utf-8", "Authorization", "Bearer "+accessToken);
		 
		System.out.println(":: accessToken::"+accessToken);
		
		JSONObject properties = (JSONObject)obj.get("properties");
		
        
        user.setEmail(obj.get("kaccount_email").toString());
        user.setProfileImage(properties.get("profile_image").toString());
        user.setName(properties.get("nickname").toString());
        user.setSnsType("1");//kakao
        user.setRole("1");
		
		return user;
	}
	

}

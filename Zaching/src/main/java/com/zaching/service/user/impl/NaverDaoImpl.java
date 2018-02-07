package com.zaching.service.user.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.service.domain.User;
import com.zaching.service.user.NaverDao;


@Repository("naverDaoImpl")
public class NaverDaoImpl implements NaverDao {
	
	private final static String CLIENT_ID = "1NQw6r85_O8fOITDL8Dc"; //"ynLHu5Y1qRtLT74HiGOR";
	private final static String CLIENT_SECRET = "pYKzsoSN5s";      //pY0Eno9_9Q";
	private final static String REDIRECT_URI = "http://127.0.0.1:8080/naverLogin";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	private final static String GET_TOKEN_API_URL = "https://nid.naver.com/oauth2.0/token";
	
	private JSONParser parser;

	
	public NaverDaoImpl() {
		this.parser = new JSONParser();
	}

	
	/* get AuthorizationUrl  Method */
	public String getAuthorizationUrl(HttpSession session){
		
		String state = generateRandomString();
		
		this.setSession(session, state);
		
		String url = "redirect:https://nid.naver.com/oauth2.0/authorize?response_type=code"
				+"&client_id="+this.CLIENT_ID+"&state="+state
				+"&redirect_uri="+this.REDIRECT_URI;
		
		System.out.println("getAuthorizationUrl :: "+url);
		
		return url;
	}
	
	/* getAccessToken Method */
	public User getAccessToken(HttpSession session, String code, String state) throws Exception{
		
			String sessionState = getSession(session);
		
		if(sessionState.equals(state)){
			
			String naverURL = GET_TOKEN_API_URL+"?grant_type=authorization_code&client_id="+CLIENT_ID
					+"&client_secret="+CLIENT_SECRET+"&code="+code;
			
			URL url = new URL(naverURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        
	        // Response Code GET
	        BufferedReader br = null;
	        
	        if(con.getResponseCode() == 200) {
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else {  
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
        	
	         String jsonData = "";
            StringBuffer response = new StringBuffer();
            
            while ((jsonData = br.readLine()) != null) {
                response.append(jsonData);
            }
            
            br.close();
            
            System.out.println("naver return json :: "+ response.toString());
            JSONObject obj = (JSONObject)parser.parse(response.toString());
            
            User user = new User();
            user.setRefreshToken(obj.get("refresh_token").toString());
            user.setAccessToken(obj.get("access_token").toString());
            
            session.setAttribute("user", user);
			
            return user;
		}
		return null;
	}
	
	/* getUserProfile */
	public User getUserProfile(User user) throws Exception {

		URL url = new URL(PROFILE_API_URL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "Bearer "+user.getAccessToken());
        
        // Response Code GET
        BufferedReader br = null;
        
        if(con.getResponseCode() == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { 
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
    	
        
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println("naver response :: "+ response.toString());
        JSONObject obj = (JSONObject)parser.parse(response.toString());
        
        JSONObject userInfo = (JSONObject)obj.get("response");
        
        user.setProfileImage(userInfo.get("profile_image").toString());
        user.setEmail(userInfo.get("email").toString());
        user.setName(userInfo.get("name").toString());
        user.setSnsType("naver");
        user.setRole("1");
        //age, gender, birthday ...
        
		return user;
	}
	
	/* generateRandomString */
	public  String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session set */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);	
	}

	/* http session get */
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}



}

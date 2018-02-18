package com.zaching.service.user.impl;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.zaching.service.domain.User;
import com.zaching.service.user.GoogleDao;
@Repository("googleDaoImpl")
public class GoogleDaoImpl  implements GoogleDao{

			private final static String CLIENT_ID = "399437770109-bg1s7v68bf7tiivacq91enjeill4ecvq.apps.googleusercontent.com";
			private final static String CLIENT_SECRET ="pUaplMqOape-IaZggWA37A53"; //"hytvs3HK7nWaMe0bHqlp8jct";
			private final static String SCOPE = "https://www.googleapis.com/auth/plus.login";
			private final static String REDIRECT_URI = "http://127.0.0.1:8080/googleLogin";
			private final static String SESSION_STATE = "oauth_state";
			
			private final static String GET_TOKEN_API_URL = "https://accounts.google.com/o/oauth2/token";
			private final static String PROFILE_API_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
			
			JSONParser parser;

			public GoogleDaoImpl() {
				this.parser = new JSONParser();
			}
			
			public String getAuthorizationUrl(HttpSession session) {
				
				String state = generateRandomString();
				
				this.setSession(session, state);
				
				String scope = "https://www.googleapis.com/auth/plus.login "+
					"https://www.googleapis.com/auth/userinfo.email "+
					"https://www.googleapis.com/auth/userinfo.profile "+
					"https://www.googleapis.com/auth/plus.me";
				
				String url = "redirect:https://accounts.google.com/o/oauth2/auth?client_id="+CLIENT_ID
						+"&response_type=code&scope="+scope
						+"&redirect_uri="+REDIRECT_URI;
				
				return url;
			}
			public User getAccessToken(HttpSession session, String code) throws Exception {
				
				System.out.println("getAccessToken(String code, User user)..............");
				
				String param = "grant_type=authorization_code&client_id="+CLIENT_ID
								+"&redirect_uri="+REDIRECT_URI+"&code="+code+"&client_secret="+CLIENT_SECRET;
				
				URL url = new URL(GET_TOKEN_API_URL);
		        HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        
		        con.setRequestMethod("POST");
		        con.setDoOutput(true);
		        con.setDoInput(true);
		        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		        
		        OutputStream os = con.getOutputStream();
		        
		        os.write(param.getBytes());
		        os.flush();
		        os.close();
		        
		        int responseCode = con.getResponseCode();
		        
		        BufferedReader br = null;
		        
		        if(responseCode==200) { 
		            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		        } else {  // ���� �߻�
		            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		        }
		        
		        String jsonData = "";
		        StringBuffer response = new StringBuffer();
		        
		        while ((jsonData = br.readLine()) != null) {
		            response.append(jsonData);
		        }
		        
		        br.close();
		        
		        System.out.println(response.toString());
		        JSONObject obj = (JSONObject)parser.parse(response.toString());
		        
		        System.out.println("access_token :: "+ obj.get("access_token"));

		        User user = new User();
		        user.setAccessToken(obj.get("access_token").toString());
		        //user.setRefreshToken(obj.get("refresh_token").toString());
		        
				return user;
				
			}

			public User getUserProfile(User user) throws Exception {
				
				System.out.println("getUserProfile(User user)...........");
				
				String param = "?alt=json&access_token="+user.getAccessToken();
		        
		        URL url = new URL(PROFILE_API_URL+param);
		        HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        
		        con.setRequestMethod("GET");
		        
		        // Response Code
		        int responseCode = con.getResponseCode();
		        
		        BufferedReader br = null;
		        
		        if(responseCode==200) { 
		            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		        } else { 
		            br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		        }
		        
		        //JSON Data �б�
		        String jsonData = "";
		        StringBuffer response = new StringBuffer();
		        
		        while ((jsonData = br.readLine()) != null) {
		            response.append(jsonData);
		        }
		        
		        br.close();
		        
		        // Console Ȯ��
		        System.out.println("response :: "+ response.toString());
		        JSONObject obj = (JSONObject)parser.parse(response.toString());
		        
		        user.setEmail(obj.get("email").toString());       
		        user.setName(obj.get("name").toString());
		        user.setProfileImage(obj.get("picture").toString());
		        user.setSnsType("4");//google!
				user.setRole("1");
				System.out.println("Google DAOImpl getUserProfile ====>"+user);
				return user;
			}
			
			/* http session set */
			private void setSession(HttpSession session,String state){
				session.setAttribute(SESSION_STATE, state);	
			}

			/* http session get */
			private String getSession(HttpSession session){
				return (String) session.getAttribute(SESSION_STATE);
			}
			
			/* generateRandomString */
			public  String generateRandomString() {
				return UUID.randomUUID().toString();
			}
}

package com.zaching.common.service.impl;

import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.zaching.common.service.FacebookRestDao;
import com.zaching.service.domain.User;

@Repository("facebookRestDaoImpl")
public class facebookRestDaoImpl implements FacebookRestDao {

	private final String FACEBOOK_CLIENT_ID = "424332204668451";
	private final String REDIRECT_URI = "http://localhost:8080/facebookLogin";
	private final String FACEBOOK_CLIENT_SECRET_KEY = "7f1da562f60668d017b3efc358efeb4f";

	private JSONParser parser;

	public facebookRestDaoImpl() {
		this.parser = new JSONParser();
	}

	@Override
	public String getAuthorizationUrl_facebook(HttpSession session) {
		
		System.out.println(":: facebookRestDao getAuthorizationUrl_facebook ::");
		
		String url = "redirect:https://www.facebook.com/dialog/oauth?client_id=" + FACEBOOK_CLIENT_ID + 
				"&redirect_uri="+REDIRECT_URI+"&scope=email,public_profile";

		return url;
	}

	@Override
	public String getAccesstoken(HttpSession session,String code) throws Exception {
		
		System.out.println(":: facebookRestDao getAccesstoken ::");
		
		String url="https://graph.facebook.com/v2.8/oauth/access_token?"+"client_id="+FACEBOOK_CLIENT_ID+
			 	"&redirect_uri="+REDIRECT_URI+"&client_secret="+FACEBOOK_CLIENT_SECRET_KEY+"&code="+code;
		
		
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet getRequest = new HttpGet(url);
		String JsonData = client.execute(getRequest, new BasicResponseHandler());
		System.out.println("facebookAccessToken / raw json : "+JsonData);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(JsonData);
		String AccessToken = (String) jsonObject.get("access_token");
		System.out.println("facebookAccessToken / accessToken : "+AccessToken);
		
		session.setAttribute("AccessToken", AccessToken);
		
		return AccessToken;
	}

	@Override
	public void getUserProfile(String accesstoken, HttpSession session) throws Exception {
			
			System.out.println(":: facebookRestDao getUserProfile ::");
			
			String url = "https://graph.facebook.com/me?"+
		            "access_token="+accesstoken+
		            "&fields=id,name,email,picture";
			
			
		 
			HttpClient client = HttpClientBuilder.create().build();
		    HttpGet getRequest = new HttpGet(url);
		    String jsonData = client.execute(getRequest, new BasicResponseHandler());
		    System.out.println("facebookAccessToken / jsonData! : "+jsonData);

		    JSONParser jsonParser = new JSONParser();
		    JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData);
		    System.out.println("facebookUserDataLoadAndSave / jsonData : "+jsonObject);

	
	}

	
	
	

}

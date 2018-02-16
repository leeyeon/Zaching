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
		
		String url = "redirect:https://www.facebook.com/dialog/oauth?client_id=" + this.FACEBOOK_CLIENT_ID + 
				"&redirect_uri="+this.REDIRECT_URI+"&scope=email,public_profile";
		
		System.out.println("getAuthorizationUrl :: "+url);

		return url;
	}

	@Override
	public User getAccesstoken(HttpSession session,String code) throws Exception {
		
		System.out.println(":: facebookRestDao getAccesstoken ::");
		
		String url="https://graph.facebook.com/v2.8/oauth/access_token?"+"client_id="+FACEBOOK_CLIENT_ID+
			 	"&redirect_uri="+REDIRECT_URI+"&client_secret="+FACEBOOK_CLIENT_SECRET_KEY+"&code="+code;
		
		
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet getRequest = new HttpGet(url);
		String JsonData = client.execute(getRequest, new BasicResponseHandler());
		System.out.println("facebookAccessToken / raw json : "+JsonData);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject obj = (JSONObject) jsonParser.parse(JsonData.toString());
		String accessToken = (String) obj.get("access_token");
		
		System.out.println("facebookAccessToken / accessToken : "+accessToken);
		
		User user = new User();
		user.setAccessToken(obj.get("access_token").toString());
		
		//session.setAttribute("access_token", accessToken);
		
		return user;
	}

	@Override
	public User getUserProfile(User user) throws Exception {
			
			System.out.println(":: facebookRestDao getUserProfile ::");
			
			String url = "https://graph.facebook.com/me?"+
		            "access_token="+user.getAccessToken()+
		            "&fields=id,name,email,picture";
			
			
		 
			HttpClient client = HttpClientBuilder.create().build();
		    HttpGet getRequest = new HttpGet(url);
		    String jsonData = client.execute(getRequest, new BasicResponseHandler());
		    System.out.println("facebookAccessToken / jsonData! : "+jsonData);

		    JSONParser jsonParser = new JSONParser();
		    JSONObject obj = (JSONObject) jsonParser.parse(jsonData.toString());
		    System.out.println("facebookUserDataLoadAndSave / jsonData : "+obj);
		    
		    user.setEmail(obj.get("email").toString());
		    user.setName(obj.get("name").toString());
		    user.setProfileImage(obj.get("picture").toString());
		    
		    user.setSnsType("2"); //facebook
		    user.setRole("1");
		    
		    
		    return user;
	}

	
	
	

}

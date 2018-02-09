package com.zaching.service.user;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface GoogleService {
	
	public String getAuthorizationUrl(HttpSession session);
	
	public User getAccessToken(HttpSession session,String code)throws Exception;
	
	public User getUserProfile(User user)throws Exception;

}

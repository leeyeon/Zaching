package com.zaching.service.user;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface NaverService {
	
	public String getAuthorizationUrl_login(HttpSession session);//네이버동의요청화면
	
	public User getAccessToken(HttpSession session, String code, String state)throws Exception; //토큰요청
	
	public User getUserProfile(User user)throws Exception;//사용자 정보 요청
	
}

package com.zaching.common.service;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface FacebookRestDao {
	
	
	public String getAuthorizationUrl_facebook(HttpSession httpSession);//로그인 화면 
	
	public User getAccesstoken(HttpSession session,String code)throws Exception;//토큰
	
	public User getUserProfile(User user)throws Exception; //사용자정보가져오기
}

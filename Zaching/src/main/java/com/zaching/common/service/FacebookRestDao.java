package com.zaching.common.service;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface FacebookRestDao {
	
	
	public String getAuthorizationUrl_facebook(HttpSession httpSession);//로그인 화면 
	
	public String getAccesstoken(HttpSession session,String code)throws Exception;//토큰
	
	public void getUserProfile(String accesstoken, HttpSession session)throws Exception; //사용자정보가져오기
}

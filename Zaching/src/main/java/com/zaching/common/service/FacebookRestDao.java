package com.zaching.common.service;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface FacebookRestDao {
	
	
	public String getAuthorizationUrl_facebook(HttpSession httpSession);//�α��� ȭ�� 
	
	public String getAccesstoken(HttpSession session,String code)throws Exception;//��ū
	
	public void getUserProfile(String accesstoken, HttpSession session)throws Exception; //�����������������
}

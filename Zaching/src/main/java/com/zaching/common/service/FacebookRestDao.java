package com.zaching.common.service;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface FacebookRestDao {
	
	
	public String getAuthorizationUrl_facebook(HttpSession httpSession);//�α��� ȭ�� 
	
	public User getAccesstoken(HttpSession session,String code)throws Exception;//��ū
	
	public User getUserProfile(User user)throws Exception; //�����������������
}

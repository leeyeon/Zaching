package com.zaching.service.user;

import javax.servlet.http.HttpSession;

import com.zaching.service.domain.User;

public interface NaverService {
	
	public String getAuthorizationUrl_login(HttpSession session);//���̹����ǿ�ûȭ��
	
	public User getAccessToken(HttpSession session, String code, String state)throws Exception; //��ū��û
	
	public User getUserProfile(User user)throws Exception;//����� ���� ��û
	
}

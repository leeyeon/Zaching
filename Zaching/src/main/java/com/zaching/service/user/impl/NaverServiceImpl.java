package com.zaching.service.user.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.service.domain.User;
import com.zaching.service.user.NaverDao;
import com.zaching.service.user.NaverService;

@Service("naverServiceImpl")
public class NaverServiceImpl implements NaverService{
	
	
	@Autowired
	@Qualifier("naverDaoImpl")
	private NaverDao naverDao;

	@Override
	public String getAuthorizationUrl_login(HttpSession session) {
		
		return naverDao.getAuthorizationUrl(session);
	}

	@Override
	public User getAccessToken(HttpSession session, String code, String state) throws Exception {
		
		return naverDao.getAccessToken(session, code, state);
	}

	@Override
	public User getUserProfile(User user) throws Exception {
		
		return naverDao.getUserProfile(user);
	}
	
	
	
}

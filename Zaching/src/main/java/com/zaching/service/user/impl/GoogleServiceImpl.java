package com.zaching.service.user.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.service.domain.User;
import com.zaching.service.user.GoogleDao;
import com.zaching.service.user.GoogleService;

@Service("googleServiceImpl")
public class GoogleServiceImpl implements GoogleService {
	
	@Autowired
	@Qualifier("googleDaoImpl")
	private GoogleDao gooleDao;
	
	@Override
	public String getAuthorizationUrl() {
		return gooleDao.getAuthorizationUrl();
	}

	@Override
	public User getAccessToken(HttpSession session,String code) throws Exception {
		return gooleDao.getAccessToken(session, code);
	}

	@Override
	public User getUserProfile(User user) throws Exception {
	
		return gooleDao.getUserProfile(user);
	}

}

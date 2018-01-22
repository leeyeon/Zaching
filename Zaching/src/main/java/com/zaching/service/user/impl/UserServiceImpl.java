package com.zaching.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserDao;
import com.zaching.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	// Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/// Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
			userDao.addUser(user);
	}

	@Override
	public User getUser(int userId) throws Exception {
		
		return userDao.getUser(userId);
	}
	

	@Override
	public User getAccountUser(int userId) throws Exception {
		
		return userDao.getAccountUser(userId);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		List<User> list= userDao.listUser(search);
		int totalCount = userDao.getTotalCount(search); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> memoryMap(Search search) throws Exception {
		
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void findPassword(String password) throws Exception {
		
	}

	@Override
	public void deleteUser(User user) throws Exception {
		userDao.updateUser(user);

	}

	@Override
	public void updateNotice(User user) throws Exception {
		
		userDao.updateNotice(user);
	}




}

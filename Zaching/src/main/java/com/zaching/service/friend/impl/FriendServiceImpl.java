package com.zaching.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.friend.FriendDao;
import com.zaching.service.friend.FriendService;

@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService{
	
	@Autowired
	@Qualifier("friendDaoImpl")
	private FriendDao friendDao;
	
	public void setFriendDao(FriendDao friendDao) {
		this.friendDao=friendDao;
	}
	
	public FriendServiceImpl() {
		
	}

	@Override
	public void deleteFreind(int friendId) throws Exception {
		friendDao.deleteFriend(friendId);
	}

	@Override
	public void updateFriend(Friend status) throws Exception {
		friendDao.updateFriend(status);
	}

	@Override
	public Friend getFriend(int friendId) throws Exception {
		
		return friendDao.getFriend(friendId);
	}

	@Override
	public void enterFriend(Friend friend) throws Exception {
		
		friendDao.enterFriend(friend);
	}

	@Override
	public void addFriend(Friend friend) throws Exception {
		friendDao.addFriend(friend);
		
		System.out.println(friend.getFriendId());
		
		friendDao.enterFriend(friend);
	}

	@Override
	public Map<String, Object> listFriend(Search search) throws Exception {
		
		System.out.println(search);
		List<Friend> list=friendDao.listFriend(search);
		int totalCount=friendDao.getTotalCount(search);
		
		System.out.println(list);
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public Map<String, Object> acceptFriend(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> recommendFriend(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	

}

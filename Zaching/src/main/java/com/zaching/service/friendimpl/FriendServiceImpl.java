package com.zaching.service.friendimpl;

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

//@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	@Qualifier("friendDaoImpl")
	private FriendDao friendDao;
	
	public void setFriendDao(FriendDao FriendDao) {
		this.friendDao=friendDao;
		
	}
	
	public FriendServiceImpl() {
		
	}

	@Override
	public void addFriend(Friend friend) throws Exception {
		friendDao.addFriend(friend);
	}

	@Override
	public Map<String, Object> listFriend(Search search) throws Exception {
		List<Friend> list=friendDao.listFriend(search);
		int totalCount=friendDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public Map<String, Object> acceptFriend(Search search) throws Exception {
		return null;
	}

	@Override
	public Map<String, Object> recommendFriend(Search search) throws Exception {
		return null;
	}

	/*@Override
	public void addMessage(Friend friend) throws Exception {
		friendDao.addMessage(friend);
		
		System.out.println(friend.getContent());
		
	}

	@Override
	public Map<String, Object> listMessage(Search search) throws Exception {
		return null;
	}

	@Override
	public void deleteMessage(Friend friend) throws Exception {
		friendDao.deleteFriend(friend);
		
	}*/
	

}

package com.zaching.service.friend;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendService {
	
	//模备肝扁
	public void addFriend(Friend friend, String status) throws Exception;
	
	//模备 府胶飘 
	public Map<String , Object> listFriend(Search search) throws Exception;
	
	//模备夸没,模备脚没
	public Map<String , Object > acceptFriend(Search search) throws Exception;
	
	//模备眠玫(舅荐档乐绰模备)
	public List<Friend> recommendFriend(int userId) throws Exception;

	//模备犬牢 
	public Friend getFriend (int friendId) throws Exception;

	//status 诀单捞飘
	public void updateFriend(Friend friend) throws Exception;

	public void deleteFreind(int friendId )throws Exception;
	
	public void  enterFriend(Friend friend) throws Exception;

	public int checkFriend(int userId, int friendId, int status) throws Exception;
	
	public void cancelFriend(int userId, int friednId, int status) throws Exception;

	public void updateStatus(int userId, int friednId, int status) throws Exception;
	
	public int checkFollow(int userId, int friendId, int status) throws Exception;
	
	public List<Friend> addBobFriend(int userId, int bobId) throws Exception;
}

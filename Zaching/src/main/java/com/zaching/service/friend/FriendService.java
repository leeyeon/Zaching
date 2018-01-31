package com.zaching.service.friend;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendService {
	
	//模备肝扁
	public void addFriend(Friend friend) throws Exception;
	
	//模备 府胶飘 
	public Map<String , Object> listFriend(Search search) throws Exception;
	
	//模备夸没,模备脚没
	public Map<String , Object > acceptFriend(Search search) throws Exception;
	
	//模备眠玫(舅荐档乐绰模备)
	public Map<String, Object> recommendFriend(Search search ) throws Exception;

	//模备犬牢 
	public Friend getFriend (int friendId) throws Exception;

	//status 诀单捞飘
	public void updateFriend(Friend friend) throws Exception;

	public void deleteFreind(int id )throws Exception;

}

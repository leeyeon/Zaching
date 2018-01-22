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
	
	//皋技瘤 累己
	public void addMessage(Friend friend) throws Exception;

	//皋技瘤 格废
	public Map<String,Object> listMessage(Search search) throws Exception;
	
	//皋技瘤 昏力
	public void deleteMessage(Friend friend) throws Exception;
	

}

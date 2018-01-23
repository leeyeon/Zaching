package com.zaching.service.friend;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendDao {
	
	//模备肝扁
	public void addFriend(Friend friend) throws Exception;
	
	//模备夸没,模备脚没
	public void acceptFriend(Friend friend) throws Exception;
	
	//模备眠玫(舅荐档乐绰模备)
	public void recommendFriend(Friend friend) throws Exception;
	
	//模备谗扁
	public void deleteFriend(Friend friend) throws Exception;
	
	//模备格废
	public List<Friend> listFriend(Search search) throws Exception;
	
	//皋技瘤 累己
	public void addMessage(Friend friend) throws Exception;
	
	//模备瞒窜
	public boolean blockFriend(Friend friendId) throws Exception;

	//皋技瘤 格废
	public List<Friend> listMessage(Search search) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;
	
	
	
	
	
	

	
	
	
}

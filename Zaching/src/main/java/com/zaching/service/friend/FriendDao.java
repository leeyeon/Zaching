package com.zaching.service.friend;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendDao {
	
	//模备肝扁
	public void addFriend(Friend friend, String status) throws Exception;
	
	//模备夸没,模备脚没
	public void acceptFriend(Friend friend) throws Exception;
	
	//模备眠玫(舅荐档乐绰模备)
	public List<Friend> recommendFriend(int userId) throws Exception;
	
	//模备谗扁
	public void deleteFriend(int friendId) throws Exception;
	
	//模备格废
	public List<Friend> listFriend(Search search) throws Exception;
	
	//模备瞒窜
	public boolean blockFriend(Friend friendId) throws Exception;
	
	//模备炼雀
	public Friend getFriend(int friendId) throws Exception;
	
	//status惑怕 诀单捞飘
	public Friend updateFriend(Friend status) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;

	public void enterFriend(Friend friend)throws Exception;
	
	public int checkFriend(int userId, int friendId, int status) throws Exception;
	
	public void cancelFriend(int userId, int friendId, int status) throws Exception;
	
	public void updateStatus(int userId, int friendId, int status) throws Exception;
	
	public int checkFollow(int userId, int friendId, int status) throws Exception;
	
	

	
	
	
}

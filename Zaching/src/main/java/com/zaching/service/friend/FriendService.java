package com.zaching.service.friend;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendService {
	
	//ģ���α�
	public void addFriend(Friend friend, String status) throws Exception;
	
	//ģ�� ����Ʈ 
	public Map<String , Object> listFriend(Search search) throws Exception;
	
	//ģ����û,ģ����û
	public Map<String , Object > acceptFriend(Search search) throws Exception;
	
	//ģ����õ(�˼����ִ�ģ��)
	public List<Friend> recommendFriend(int userId) throws Exception;

	//ģ��Ȯ�� 
	public Friend getFriend (int friendId) throws Exception;

	//status ������Ʈ
	public void updateFriend(Friend friend) throws Exception;

	public void deleteFreind(int friendId )throws Exception;
	
	public void  enterFriend(Friend friend) throws Exception;

	public int checkFriend(int userId, int friendId, int status) throws Exception;
	
	public void cancelFriend(int userId, int friednId, int status) throws Exception;

	public void updateStatus(int userId, int friednId, int status) throws Exception;
	
	public int checkFollow(int userId, int friendId, int status) throws Exception;
	
	public List<Friend> addBobFriend(int userId, int bobId) throws Exception;
}

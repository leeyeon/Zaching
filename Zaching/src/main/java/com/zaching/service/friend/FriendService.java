package com.zaching.service.friend;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendService {
	
	//ģ���α�
	public void addFriend(Friend friend) throws Exception;
	
	//ģ�� ����Ʈ 
	public Map<String , Object> listFriend(Search search) throws Exception;
	
	//ģ����û,ģ����û
	public Map<String , Object > acceptFriend(Search search) throws Exception;
	
	//ģ����õ(�˼����ִ�ģ��)
	public Map<String, Object> recommendFriend(Search search ) throws Exception;

	//ģ��Ȯ�� 
	public Friend getFriend (int friendId) throws Exception;

	//status ������Ʈ
	public void updateFriend(Friend friend) throws Exception;

	public void deleteFreind(int id )throws Exception;

}

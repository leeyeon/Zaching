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
	
	//�޼��� �ۼ�
	public void addMessage(Friend friend) throws Exception;

	//�޼��� ���
	public Map<String,Object> listMessage(Search search) throws Exception;
	
	//�޼��� ����
	public void deleteMessage(Friend friend) throws Exception;
	

}

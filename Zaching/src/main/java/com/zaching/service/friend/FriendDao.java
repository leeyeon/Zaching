package com.zaching.service.friend;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;

public interface FriendDao {
	
	//ģ���α�
	public void addFriend(Friend friend) throws Exception;
	
	//ģ����û,ģ����û
	public void acceptFriend(Friend friend) throws Exception;
	
	//ģ����õ(�˼����ִ�ģ��)
	public List<Friend> recommendFriend(Search search) throws Exception;
	
	//ģ������
	public void deleteFriend(int friendId) throws Exception;
	
	//ģ�����
	public List<Friend> listFriend(Search search) throws Exception;
	
	//ģ������
	public boolean blockFriend(Friend friendId) throws Exception;
	
	//ģ����ȸ
	public Friend getFriend(int friendId) throws Exception;
	
	//status���� ������Ʈ
	public Friend updateFriend(Friend status) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;

	public void enterFriend(Friend friend)throws Exception;
	
	
	
	
	
	

	
	
	
}

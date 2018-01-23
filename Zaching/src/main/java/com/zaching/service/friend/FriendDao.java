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
	public void recommendFriend(Friend friend) throws Exception;
	
	//ģ������
	public void deleteFriend(Friend friend) throws Exception;
	
	//ģ�����
	public List<Friend> listFriend(Search search) throws Exception;
	
	//�޼��� �ۼ�
	public void addMessage(Friend friend) throws Exception;
	
	//ģ������
	public boolean blockFriend(Friend friendId) throws Exception;

	//�޼��� ���
	public List<Friend> listMessage(Search search) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;
	
	
	
	
	
	

	
	
	
}

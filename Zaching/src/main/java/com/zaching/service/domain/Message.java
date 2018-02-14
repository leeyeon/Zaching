package com.zaching.service.domain;

import java.util.Date;

public class Message {
	
	private int messageId;// �޼��� ID������
	private int userId;//���� ID������
	private int friendId;// ģ��ID ������
	private Date createdDate ;//�ۼ���¥
	private String content;//�޼��� ����
	private String name;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Message() {
		
	}

	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "Message [messageId="+messageId+",userId="+userId+",friendId="+friendId
				+",createdDate="+createdDate +",content="+content+"]";
		
		
	}
	
	
}

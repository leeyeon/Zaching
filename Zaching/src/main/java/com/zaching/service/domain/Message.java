package com.zaching.service.domain;

import java.util.Date;

public class Message {
	
	private int roomId;
	private int messageId;// �޼��� ID������
	private int userId;//���� ID������
	private int friendId;// ģ��ID ������
	private String createdDate ;//�ۼ���¥
	private String content;//�޼��� ����
	private String friendProfileImage;
	private String friendName;
	
	public Message() {
		
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getFriendProfileImage() {
		return friendProfileImage;
	}

	public void setFriendProfileImage(String friendProfileImage) {
		this.friendProfileImage = friendProfileImage;
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}

	@Override
	public String toString() {
		return "Message [roomId=" + roomId + ", messageId=" + messageId + ", userId=" + userId + ", friendId="
				+ friendId + ", createdDate=" + createdDate + ", content=" + content + ", friendProfileImage="
				+ friendProfileImage + ", friendName=" + friendName + "]";
	}
	
	
}

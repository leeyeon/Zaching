package com.zaching.service.domain;

import java.util.Date;

public class Friend {

	private int friendId;// ģ��ID ������
	private String name;// �̸�
	private String profileImage;// �����ʻ���
	private String status;//
	private String content;// �޼�������
	private int messageId;// �޼��� ID������
	private Date sendMessageDate;// �޼��� ������¥
	private Date getMessageDate;// �޼��� ������¥
	private String senderUserName;// �޼��� �������
	private String getUserName;// �޼��� �޴»��

	public Friend() {

	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getSenderUserName() {
		return senderUserName;
	}

	public void setSenderUserName(String senderUserName) {
		this.senderUserName = senderUserName;
	}

	public String getGetUserName() {
		return getUserName;
	}

	public void setGetUserName(String getUserName) {
		this.getUserName = getUserName;
	}

	public Date getSendMessageDate() {
		return sendMessageDate;
	}

	public void setSendMessageDate(Date sendMessageDate) {
		this.sendMessageDate = sendMessageDate;
	}

	public Date getGetMessageDate() {
		return getMessageDate;
	}

	public void setGetMessageDate(Date getMessageDate) {
		this.getMessageDate = getMessageDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
		
		@Override
		public String toString() {
			return "Friend [friend="+friendId+",name="+name
					+",profileImage="+profileImage+",status="+status
					+",content="+content+",messageId="+messageId
					+",sendMessageDate="+sendMessageDate+",getMessageDate="+getMessageDate
					+",senderUserName="+senderUserName+",getUserName="+getUserName+"]";
			
		
	}

}

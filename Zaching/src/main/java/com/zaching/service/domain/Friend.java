package com.zaching.service.domain;

import java.util.Date;

public class Friend {

	private int friendId;// ģ��ID ������
	private String name;// �̸�
	private String profileImage;// �����ʻ���
	private String status;//

	public Friend() {

	}

		
		public int getFriendId() {
		return friendId;
	}


	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


		@Override
		public String toString() {
			return "Friend [friendId="+friendId+",name="+name
					+",profileImage="+profileImage+",status="+status+"]";
			
		
	}

}



package com.zaching.service.domain;

public class Friend {
	
	private int id;
	private int friendId;
	private int userId;
	private int status;
	private String profileImage;//프로필사진
	private String name;//실명

	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Friend() {

	}

		
		public int getFriendId() {
		return friendId;
	}


	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}




	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}



		public int getUserId() {
			return userId;
		}


		public void setUserId(int userId) {
			this.userId = userId;
		}
		
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}
		
		@Override
		public String toString() {
			return "Friend [id="+id+",friendId="+friendId+",userId="+userId+",status="+status+"]";
		}
		




}





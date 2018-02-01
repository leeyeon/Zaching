package com.zaching.service.domain;

import java.util.Date;

public class Friend {
	
	private int id;
	private int friendId;// 模备ID 矫啮胶
	private int userId;//模备 ID矫啮胶
	private int status;//

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





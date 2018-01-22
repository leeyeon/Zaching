package com.zaching.service.domain;

import java.util.Date;

public class Comment {
	
	private int commentId;
	private int roomId;
	/* 뉴스피드/밥친구/보이스리플 구분 */
	private String category;
	private int userId;
	private String content;
	private Date createdDate;
	/* 조회 가능/ 조회 불가능 (삭제 유무) */
	private String status;
	private String userName;
	private String userProfile;

	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", roomId=" + roomId + ", category=" + category + ", userId="
				+ userId + ", content=" + content + ", createdDate=" + createdDate + ", status=" + status
				+ ", userName=" + userName + ", userProfile=" + userProfile + "]";
	}

	
}

package com.zaching.service.domain;

import org.springframework.web.multipart.MultipartFile;

public class Newsfeed {
	
	private int newsfeedId;
	private String categoryCode;
	private String fileName;
	private String content;
	private String locationX;
	private String locationY;
	private String regDate;
	private int userId;
	private String locationName;
	private int countLikey;
	private int countReply;
	private String privacyBound;
	private String status;
	private MultipartFile file;
	private String userName;
	private String profileImage;
	private String likeUser;

	

	public String getLikeUser() {
		return likeUser;
	}



	public void setLikeUser(String likeUser) {
		this.likeUser = likeUser;
	}



	public int getNewsfeedId() {
		return newsfeedId;
	}



	public void setNewsfeedId(int newsfeedId) {
		this.newsfeedId = newsfeedId;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
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



	public Newsfeed() {
		// TODO Auto-generated constructor stub
	}



	public String getPrivacyBound() {
		return privacyBound;
	}



	public void setPrivacyBound(String privacyBound) {
		this.privacyBound = privacyBound;
	}



	public String getCategoryCode() {
		return categoryCode;
	}



	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getLocationX() {
		return locationX;
	}



	public void setLocationX(String locationX) {
		this.locationX = locationX;
	}



	public String getLocationY() {
		return locationY;
	}



	public void setLocationY(String locationY) {
		this.locationY = locationY;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getLocationName() {
		return locationName;
	}



	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}



	public int getCountLikey() {
		return countLikey;
	}



	public void setCountLikey(int countLikey) {
		this.countLikey = countLikey;
	}



	public int getCountReply() {
		return countReply;
	}



	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}



	public MultipartFile getFile() {
		return file;
	}



	public void setFile(MultipartFile file) {
		this.file = file;
	}



	@Override
	public String toString() {
		return "Newsfeed [newsfeedId=" + newsfeedId + ", categoryCode=" + categoryCode + ", fileName=" + fileName
				+ ", content=" + content + ", locationX=" + locationX + ", locationY=" + locationY + ", regDate="
				+ regDate + ", userId=" + userId + ", locationName=" + locationName + ", countLikey=" + countLikey
				+ ", countReply=" + countReply + ", privacyBound=" + privacyBound + ", status=" + status + ", file="
				+ file + ", userName=" + userName + ", profileImage=" + profileImage + ", likeUser=" + likeUser + "]";
	}




	

	
	
	

}

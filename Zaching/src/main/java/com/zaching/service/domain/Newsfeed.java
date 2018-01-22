package com.zaching.service.domain;

public class Newsfeed {
	
	private int newsfeedID;
	private String fileName;
	private String content;
	private int locationX;
	private int locationY;
	private String regDate;
	private int userID;
	private String locationName;
	private int countLikey;
	private int countReply;
	private String privacyBound;
	private String status;
	private String categoryCode;
	private int roomID;

	public Newsfeed() {
		// TODO Auto-generated constructor stub
	}

	public int getNewsfeedID() {
		return newsfeedID;
	}

	public void setNewsfeedID(int newsfeedID) {
		this.newsfeedID = newsfeedID;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getLocationX() {
		return locationX;
	}

	public void setLocationX(int locationX) {
		this.locationX = locationX;
	}
	
	public int getLocationY() {
		return locationY;
	}

	public void setLocationY(int locationY) {
		this.locationY = locationY;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPrivacyBound() {
		return privacyBound;
	}

	public void setPrivacyBound(String privacyBound) {
		this.privacyBound = privacyBound;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getRoomID() {
		return roomID;
	}

	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}

	@Override
	public String toString() {
		return "Newsfeed [newsfeedID=" + newsfeedID + ", fileName=" + fileName + ", content=" + content + ", locationX="
				+ locationX + ", locationY=" + locationY + ", regDate=" + regDate + ", userID=" + userID
				+ ", locationName=" + locationName + ", countLikey=" + countLikey + ", countReply=" + countReply + "]";
	}

	
	

}

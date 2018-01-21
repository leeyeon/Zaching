package com.zaching.service.domain;

public class Newsfeed {
	
	private int newsfeedID;
	private String imgFile;
	private String newsfeedText;
	private String location;
	private String regDate;
	private int userID;
	private String locationName;
	private int countLikey;
	private int countReply;

	public Newsfeed() {
		// TODO Auto-generated constructor stub
	}

	public int getNewsfeedID() {
		return newsfeedID;
	}

	public void setNewsfeedID(int newsfeedID) {
		this.newsfeedID = newsfeedID;
	}

	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	public String getNewsfeedText() {
		return newsfeedText;
	}

	public void setNewsfeedText(String newsfeedText) {
		this.newsfeedText = newsfeedText;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	@Override
	public String toString() {
		return "Newsfeed [newsfeedID=" + newsfeedID + ", imgFile=" + imgFile + ", newsfeedText=" + newsfeedText
				+ ", location=" + location + ", regDate=" + regDate + ", userID=" + userID + ", locationName="
				+ locationName + ", countLikey=" + countLikey + ", countReply=" + countReply + "]";
	}
	
	

}

package com.zaching.service.domain;

public class Voice {
	
	private int voiceID ;
	private String voiceName;
	private String voiceCategory;
	private String voicelyrics;
	private String regDate;
	private int userID;
	private String backgroundImage;
	private int countReply;
	private int countUser;
	private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Voice() {
		// TODO Auto-generated constructor stub
	}

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	public int getCountUser() {
		return countUser;
	}

	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}

	public String getBackgroundImage() {
		return backgroundImage;
	}

	public void setBackgroundImage(String backgroundImage) {
		this.backgroundImage = backgroundImage;
	}

	public int getVoiceID() {
		return voiceID;
	}

	public void setVoiceID(int voiceID) {
		this.voiceID = voiceID;
	}

	public String getVoiceName() {
		return voiceName;
	}

	public void setVoiceName(String voiceName) {
		this.voiceName = voiceName;
	}

	public String getVoiceCategory() {
		return voiceCategory;
	}

	public void setVoiceCategory(String voiceCategory) {
		this.voiceCategory = voiceCategory;
	}

	public String getVoicelyrics() {
		return voicelyrics;
	}

	public void setVoicelyrics(String voicelyrics) {
		this.voicelyrics = voicelyrics;
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

	@Override
	public String toString() {
		return "Voice [voiceID=" + voiceID + ", voiceName=" + voiceName + ", voiceCategory=" + voiceCategory
				+ ", voicelyrics=" + voicelyrics + ", regDate=" + regDate + ", userID=" + userID + ", backgroundImage="
				+ backgroundImage + ", countReply=" + countReply + ", countUser=" + countUser + ", status=" + status
				+ "]";
	}

	


	
	

}

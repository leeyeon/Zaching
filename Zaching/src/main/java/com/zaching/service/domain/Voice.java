package com.zaching.service.domain;

public class Voice {
	
	private int voiceId ;
	private String voiceName;
	private int categoryCode;
	private String voiceIyrics;
	private String regDate;
	private int userID;
	private String backgroundImage;
	private String countReply;
	private String countUser;
	private String status;
	
	public Voice() {
		// TODO Auto-generated constructor stub
	}

	public int getVoiceId() {
		return voiceId;
	}

	public void setVoiceId(int voiceId) {
		this.voiceId = voiceId;
	}

	public String getBackgroundImage() {
		return backgroundImage;
	}

	public void setBackgroundImage(String backgroundImage) {
		this.backgroundImage = backgroundImage;
	}

	public String getCountReply() {
		return countReply;
	}

	public void setCountReply(String countReply) {
		this.countReply = countReply;
	}

	public String getCountUser() {
		return countUser;
	}

	public void setCountUser(String countUser) {
		this.countUser = countUser;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getvoiceId() {
		return voiceId;
	}

	public void setvoiceId(int voiceId) {
		this.voiceId = voiceId;
	}

	public String getVoiceName() {
		return voiceName;
	}

	public void setVoiceName(String voiceName) {
		this.voiceName = voiceName;
	}

	public int getcategoryCode() {
		return categoryCode;
	}

	public void setcategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getVoiceIyrics() {
		return voiceIyrics;
	}

	public void setVoiceIyrics(String voiceIyrics) {
		this.voiceIyrics = voiceIyrics;
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
		return "Voice [voiceId=" + voiceId + ", voiceName=" + voiceName + ", categoryCode=" + categoryCode
				+ ", voiceIyrics=" + voiceIyrics + ", regDate=" + regDate + ", userID=" + userID + "]";
	}


	
	

}

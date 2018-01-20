package com.zaching.service.domain;

public class Voice {
	
	private int voiceID ;
	private String voiceName;
	private int voiceCategory;
	private String voiceIyrics;
	private String regDate;
	private int userID;
	
	public Voice() {
		// TODO Auto-generated constructor stub
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

	public int getVoiceCategory() {
		return voiceCategory;
	}

	public void setVoiceCategory(int voiceCategory) {
		this.voiceCategory = voiceCategory;
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
		return "Voice [voiceID=" + voiceID + ", voiceName=" + voiceName + ", voiceCategory=" + voiceCategory
				+ ", voiceIyrics=" + voiceIyrics + ", regDate=" + regDate + ", userID=" + userID + "]";
	}


	
	

}

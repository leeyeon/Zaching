package com.zaching.service.domain;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class Voice {
	
	private int voiceId ;
	private String voiceName;
	private String categoryCode;
	private String voicelyrics;
	private String regDate;
	private int userId;
	private String backgroundImage;
	private int countReply;
	private int countUser;
	private String status;
	private String userName;
	private String profileImage;
	private MultipartFile uploadFile;
	
	

	public Voice() {
		// TODO Auto-generated constructor stub
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
	
	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVoiceName() {
		return voiceName;
	}

	public void setVoiceName(String voiceName) {
		this.voiceName = voiceName;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Voice [voiceId=" + voiceId + ", voiceName=" + voiceName + ", categoryCode=" + categoryCode
				+ ", voicelyrics=" + voicelyrics + ", regDate=" + regDate + ", userId=" + userId + ", backgroundImage="
				+ backgroundImage + ", countReply=" + countReply + ", countUser=" + countUser + ", status=" + status
				+ ", userName=" + userName + ", profileImage=" + profileImage + ", uploadFile=" + uploadFile + "]";
	}


}

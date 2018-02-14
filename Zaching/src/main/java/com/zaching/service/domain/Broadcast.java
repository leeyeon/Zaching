package com.zaching.service.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Broadcast {
	
	private int userId;
	private String userName;
	private String profileImage; 
	private String title; // ����
	private String detail; // ��� ����
	private MultipartFile image; //��ǥ �̹���
	private String forbidden; //������ 
	private Date date; // ��¥ 
	private String fileName;
	private String status;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getForbidden() {
		return forbidden;
	}
	public void setForbidden(String forbidden) {
		this.forbidden = forbidden;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Broadcast [userId=" + userId + ", userName=" + userName + ", profileImage=" + profileImage + ", title="
				+ title + ", detail=" + detail + ", image=" + image + ", forbidden=" + forbidden + ", date=" + date
				+ ", fileName=" + fileName + ", status=" + status + "]";
	}
	

		
}

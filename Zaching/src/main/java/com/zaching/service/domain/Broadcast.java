package com.zaching.service.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Broadcast {
	
	private User broadcaster; //방송하는 사람 정보 
	private String title; // 제목
	private String detail; // 방송 내용
	private MultipartFile image; //대표 이미지
	private String forbidden; //금지어 
	private Date date; // 날짜 
	private String fileName;
	public User getBroadcaster() {
		return broadcaster;
	}
	public void setBroadcaster(User broadcaster) {
		this.broadcaster = broadcaster;
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
	@Override
	public String toString() {
		return "Broadcast [broadcaster=" + broadcaster + ", title=" + title + ", detail=" + detail + ", image=" + image
				+ ", forbidden=" + forbidden + ", date=" + date + ", fileName=" + fileName + "]";
	}
		
}

package com.zaching.service.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Broadcast {
	
	private User broadcaster; //����ϴ� ��� ���� 
	private String title; // ����
	private String detail; // ��� ����
	private MultipartFile image; //��ǥ �̹���
	private String forbidden; //������ 
	private Date date; // ��¥ 
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

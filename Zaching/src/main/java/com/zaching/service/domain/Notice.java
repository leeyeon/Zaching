package com.zaching.service.domain;

import java.util.Date;

public class Notice {
	
	private int noticeId; 
	private String category;
	private Date date;
	private int bobId;
	private int senderId;
	private String content;
	private int noticeTargetId;
	private int userId;
	private char status;
	
	private String name;
	

	
	

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Notice() {
		// TODO Auto-generated constructor stub
	}



	public int getNoticeId() {
		return noticeId;
	}



	public String getCategory() {
		return category;
	}



	public Date getDate() {
		return date;
	}



	public int getBobId() {
		return bobId;
	}



	public int getSenderId() {
		return senderId;
	}



	



	public int getUserId() {
		return userId;
	}



	public char getStatus() {
		return status;
	}



	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public void setBobId(int bobId) {
		this.bobId = bobId;
	}



	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}





	public void setUserId(int userId) {
		this.userId = userId;
	}



	public void setStatus(char status) {
		this.status = status;
	}



	public int getNoticeTargetId() {
		return noticeTargetId;
	}



	public void setNoticeTargetId(int noticeTargetId) {
		this.noticeTargetId = noticeTargetId;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", category=" + category + ", date=" + date + ", bobId=" + bobId
				+ ", senderId=" + senderId + ", content=" + content + ", noticeTargetId=" + noticeTargetId + ", userId="
				+ userId + ", status=" + status + ", name=" + name + "]";
	}

}

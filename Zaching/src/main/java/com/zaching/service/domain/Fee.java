package com.zaching.service.domain;

import java.util.Date;

public class Fee {
	
	private int participantId;
	private int userId;
	private Date paidDate;
	private int paidFee;
	private String userImage;
	private String userName;
	/*
	 * 회비 냈는지 안냈는지 구분 
	 */
	private String status;

	public Fee() {
		// TODO Auto-generated constructor stub
	}

	public int getParticipantId() {
		return participantId;
	}

	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(Date paidDate) {
		this.paidDate = paidDate;
	}

	public int getPaidFee() {
		return paidFee;
	}

	public void setPaidFee(int paidFee) {
		this.paidFee = paidFee;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Fee [participantId=" + participantId + ", userId=" + userId + ", paidDate=" + paidDate + ", paidFee="
				+ paidFee + ", userImage=" + userImage + ", userName=" + userName + ", status=" + status + "]";
	}

}

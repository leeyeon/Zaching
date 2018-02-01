package com.zaching.service.domain;

import java.util.Date;
import java.util.List;

public class Participant {
	
	private int participantId;
	/* User TimeLine으로 이동하기 위함 */
	private int userId;
	private String participantName;
	private String participantProfile;
	private Date participatedDate;
	private String isAutoFee;
	private boolean isWriter;
	private String status;
	private String paidDate;
	private int paidFee;

	public Participant() {

	}
	
	public int getParticipantId() {
		return participantId;
	}
	
	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}
	
	public String getParticipantName() {
		return participantName;
	}
	
	public void setParticipantName(String participantName) {
		this.participantName = participantName;
	}
	
	public String getParticipantProfile() {
		return participantProfile;
	}
	
	public void setParticipantProfile(String participantProfile) {
		this.participantProfile = participantProfile;
	}
	
	public Date getParticipatedDate() {
		return participatedDate;
	}
	
	public void setParticipatedDate(Date participatedDate) {
		this.participatedDate = participatedDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getIsAutoFee() {
		return isAutoFee;
	}

	public void setIsAutoFee(String isAutoFee) {
		this.isAutoFee = isAutoFee;
	}

	public boolean getIsWriter() {
		return isWriter;
	}

	public void setIsWriter(int writerId) {
		if(writerId == this.userId) {
			this.isWriter = true;
		} else {
			this.isWriter = false;
		}
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}

	public int getPaidFee() {
		return paidFee;
	}

	public void setPaidFee(int paidFee) {
		this.paidFee = paidFee;
	}

	@Override
	public String toString() {
		return "Participant [participantId=" + participantId + ", userId=" + userId + ", participantName="
				+ participantName + ", participantProfile=" + participantProfile + ", participatedDate="
				+ participatedDate + ", isAutoFee=" + isAutoFee + ", isWriter=" + isWriter + ", status=" + status
				+ ", paidDate=" + paidDate + ", paidFee=" + paidFee + "]";
	}

}

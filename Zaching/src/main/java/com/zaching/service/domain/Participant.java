package com.zaching.service.domain;

import java.util.Date;
import java.util.List;

public class Participant {
	
	private int participantId;
	private String participantName;
	private String participantProfile;
	private Date participatedDate;
	private String status;

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

	@Override
	public String toString() {
		return "Participant [participantId=" + participantId + ", participantName=" + participantName
				+ ", participantProfile=" + participantProfile + ", participatedDate=" + participatedDate + ", status="
				+ status + "]";
	}

}

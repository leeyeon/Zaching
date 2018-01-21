package com.zaching.service.domain;

import java.util.Date;
import java.util.List;

public class Bob {
	
	private int bobId;
	private int writtenUserId;
	private String writtenUserName;
	private String writtenUserProfile;
	private String category;
	private String title;
	private String content;
	private String image;
	private int limitNum;
	private String locationName;
	private String latitude;
	private String longitude;
	private Date AppointmentTime;
	private Date createdDate;
	private int fee;
	private Date feeDate;
	private String status;

	public Bob() {
		// TODO Auto-generated constructor stub
	}

	public int getBobId() {
		return bobId;
	}

	public void setBobId(int bobId) {
		this.bobId = bobId;
	}

	public int getWrittenUserId() {
		return writtenUserId;
	}

	public void setWrittenUserId(int writtenUserId) {
		this.writtenUserId = writtenUserId;
	}

	public String getWrittenUserName() {
		return writtenUserName;
	}

	public void setWrittenUserName(String writtenUserName) {
		this.writtenUserName = writtenUserName;
	}

	public String getWrittenUserProfile() {
		return writtenUserProfile;
	}

	public void setWrittenUserProfile(String writtenUserProfile) {
		this.writtenUserProfile = writtenUserProfile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getLimitNum() {
		return limitNum;
	}

	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public Date getAppointmentTime() {
		return AppointmentTime;
	}

	public void setAppointmentTime(Date appointmentTime) {
		AppointmentTime = appointmentTime;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public Date getFeeDate() {
		return feeDate;
	}

	public void setFeeDate(Date feeDate) {
		this.feeDate = feeDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Bob [bobId=" + bobId + ", writtenUserId=" + writtenUserId + ", writtenUserName=" + writtenUserName
				+ ", writtenUserProfile=" + writtenUserProfile + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", image=" + image + ", limitNum=" + limitNum + ", locationName="
				+ locationName + ", latitude=" + latitude + ", longitude=" + longitude + ", AppointmentTime="
				+ AppointmentTime + ", createdDate=" + createdDate + ", fee=" + fee + ", feeDate=" + feeDate
				+ ", status=" + status + "]";
	}

}


package com.zaching.service.domain;

import java.util.Date;
import java.util.List;

public class Bob {
	
	private int bobId;
	private int writtenUserID;
	private String writtenUserName;
	private String writtenUserProfile;
	private String category;
	private String title;
	private String description;
	private String image;
	private int limitNum;
	private String locationName;
	private String latitude;
	private String longtitude;
	private Date createdDate;
	private int fee;
	private Date feeDate;
	private String status;
	private List<Participant> listParticipant;

	public Bob() {
		// TODO Auto-generated constructor stub
	}

	public int getBobId() {
		return bobId;
	}

	public void setBobId(int bobId) {
		this.bobId = bobId;
	}

	public int getWrittenUserID() {
		return writtenUserID;
	}

	public void setWrittenUserID(int writtenUserID) {
		this.writtenUserID = writtenUserID;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
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

	public List<Participant> getListParticipant() {
		return listParticipant;
	}

	public void setListParticipant(List<Participant> listParticipant) {
		this.listParticipant = listParticipant;
	}

	@Override
	public String toString() {
		return "Bob [bobId=" + bobId + ", writtenUserID=" + writtenUserID + ", writtenUserName=" + writtenUserName
				+ ", writtenUserProfile=" + writtenUserProfile + ", category=" + category + ", title=" + title
				+ ", description=" + description + ", image=" + image + ", limitNum=" + limitNum + ", locationName="
				+ locationName + ", latitude=" + latitude + ", longtitude=" + longtitude + ", createdDate="
				+ createdDate + ", fee=" + fee + ", feeDate=" + feeDate + ", status=" + status + ", listParticipant="
				+ listParticipant + "]";
	}
}

package com.zaching.service.domain;

import java.sql.Date;

public class LivingInfo {
	
	private String address;
	private String eventInfoImage;
	private String eventInfoName;
	private String evnetInfoPrice;
	private String categoryGroupName;
	private String addressName;
	private String categoryname;
	private String location;
	private String MapX;
	private String MapY;
	private String rentPrice;
	


	

	public String getRentPrice() {
		return rentPrice;
	}



	public void setRentPrice(String rentPrice) {
		this.rentPrice = rentPrice;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEventInfoImage() {
		return eventInfoImage;
	}

	public void setEventInfoImage(String eventInfoImage) {
		this.eventInfoImage = eventInfoImage;
	}

	public String getEventInfoName() {
		return eventInfoName;
	}

	public void setEventInfoName(String eventInfoName) {
		this.eventInfoName = eventInfoName;
	}

	public String getEvnetInfoPrice() {
		return evnetInfoPrice;
	}

	public void setEvnetInfoPrice(String evnetInfoPrice) {
		this.evnetInfoPrice = evnetInfoPrice;
	}

	public String getCategoryGroupName() {
		return categoryGroupName;
	}

	public void setCategoryGroupName(String categoryGroupName) {
		this.categoryGroupName = categoryGroupName;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String placeName) {
		this.location = placeName;
	}

	public String getMapX() {
		return MapX;
	}

	public void setMapX(String mapX) {
		MapX = mapX;
	}

	public String getMapY() {
		return MapY;
	}

	public void setMapY(String mapY) {
		MapY = mapY;
	}

	public LivingInfo() {
		
	}



	@Override
	public String toString() {
		return "LivingInfo [address=" + address + ", eventInfoImage=" + eventInfoImage + ", eventInfoName="
				+ eventInfoName + ", evnetInfoPrice=" + evnetInfoPrice + ", categoryGroupName=" + categoryGroupName
				+ ", addressName=" + addressName + ", categoryname=" + categoryname + ", location=" + location
				+ ", MapX=" + MapX + ", MapY=" + MapY + ", rentPrice=" + rentPrice + "]";
	}
	
	
	
}

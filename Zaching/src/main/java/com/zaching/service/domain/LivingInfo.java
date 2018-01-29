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
	
	private String movieinfo;
	private String movieImg;
	private String movieName;
	private String movieCode;
	
	private String title;
	private String author;
	private String priceSales;
	private String cover;
	private String description;
	
	
	
	public String getTitle() {
		return title;
	}



	public String getAuthor() {
		return author;
	}



	public String getPriceSales() {
		return priceSales;
	}



	public String getCover() {
		return cover;
	}



	public String getDescription() {
		return description;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public void setPriceSales(String priceSales) {
		this.priceSales = priceSales;
	}



	public void setCover(String cover) {
		this.cover = cover;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getMovieCode() {
		return movieCode;
	}



	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}



	public String getMovieName() {
		
		return movieName;
	}



	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}



	public String getMovieImg() {
		return movieImg;
	}



	public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}



	public String getMovieinfo() {
		return movieinfo;
	}



	public void setMovieinfo(String movieinfo) {
		this.movieinfo = movieinfo;
	}



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

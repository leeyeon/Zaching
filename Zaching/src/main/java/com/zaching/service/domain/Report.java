package com.zaching.service.domain;

import java.util.Date;

public class Report {
	
	private int reportID;
	private String category; // 회원 : 1 , 밥친구 : 2 , 뉴스피드  : 3, 보이스 : 4
	private int userID;
	private Date day;
	private char flag;
	private String text;
	private int reportUserID;
	private int roomID;
	
	
	

	public Report() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getRoomID() {
		return roomID;
	}



	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}



	public int getReportID() {
		return reportID;
	}

	public void setReportID(int reportID) {
		this.reportID = reportID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

		

	public Date getDay() {
		return day;
	}



	public void setDay(Date day) {
		this.day = day;
	}



	public char getFlag() {
		return flag;
	}



	public void setFlag(char flag) {
		this.flag = flag;
	}



	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	

	public int getReportUserID() {
		return reportUserID;
	}



	public void setReportUserID(int reportUserID) {
		this.reportUserID = reportUserID;
	}



	@Override
	public String toString() {
		return "Report [reportID=" + reportID + ", category=" + category + ", userID=" + userID + ", day=" + day
				+ ", flag=" + flag + ", text=" + text + ", reportUserID=" + reportUserID + "]";
	}
	
	

}

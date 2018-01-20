package com.zaching.service.domain;

public class Report {
	
	private int reportID;
	private String category;
	private int userID;
	private String day;
	private boolean flag;
	private String text;
	private String reportUserID;

	public Report() {
		// TODO Auto-generated constructor stub
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

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getReportUserID() {
		return reportUserID;
	}

	public void setReportUserID(String reportUserID) {
		this.reportUserID = reportUserID;
	}

	@Override
	public String toString() {
		return "Report [reportID=" + reportID + ", category=" + category + ", userID=" + userID + ", day=" + day
				+ ", flag=" + flag + ", text=" + text + ", reportUserID=" + reportUserID + "]";
	}
	
	

}

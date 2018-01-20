package com.zaching.service.domain;

import java.util.Date;

public class Payment {
	
	private Date createdDate;
	private String status;
	private int point;

	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Payment [createdDate=" + createdDate + ", status=" + status + ", point=" + point + "]";
	}

}

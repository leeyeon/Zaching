package com.zaching.service.domain;

import java.util.Date;

public class Fee {
	
	private int userId;
	private Date paidDate;
	private int paidFee;
	/*
	 * ȸ�� �´��� �ȳ´��� ���� 
	 */
	private String status;

	public Fee() {
		// TODO Auto-generated constructor stub
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Fee [paidDate=" + paidDate + ", paidFee=" + paidFee + ", status=" + status + "]";
	}

}

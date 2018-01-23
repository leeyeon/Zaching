package com.zaching.service.domain;

import java.util.Date;

public class Payment {
	
	private int paymentId;
	private String createdDate;
	/*
	 * P: ����Ʈ / M:���ϸ���
	 * P01: ����
	 * P02: ���
	 * P03: ��ȯ��û
	 * P04: ��ȯ�Ϸ�
	 * P05: ��ȯ��û���
	 * M01: ����
	 * M02: ���
	 * */
	private String paymentCode;
	private int userId;
	private int point;
	private int receiverId;
	private String realName;
	private int bankCode;
	private String accountNumber;
	private int accountCi;
	private int accountSeqNo;

	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	
	public String getRealName() {
		return realName;
	}


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public int getBankCode() {
		return bankCode;
	}


	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}


	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}


	public int getAccountCi() {
		return accountCi;
	}


	public void setAccountCi(int accountCi) {
		this.accountCi = accountCi;
	}


	public int getAccountSeqNo() {
		return accountSeqNo;
	}


	public void setAccountSeqNo(int accountSeqNo) {
		this.accountSeqNo = accountSeqNo;
	}


	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", createdDate=" + createdDate + ", paymentCode=" + paymentCode
				+ ", userId=" + userId + ", point=" + point + ", receiverId=" + receiverId + ", realName=" + realName
				+ ", bankCode=" + bankCode + ", accountNumber=" + accountNumber + ", accountCi=" + accountCi
				+ ", accountSeqNo=" + accountSeqNo + "]";
	}

}

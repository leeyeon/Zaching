package com.zaching.service.domain;

import java.util.Date;

public class User {
	
	///Field
	private int userId;//����ID������
	private String email;//�̸���ID
	private String password;//�н�����
	private String name;//�̸�
	private String address;//�ּ�
	private int longtitude;//�浵
	private int latitude;//����
	private String gender;//����
	private String phone;//����ó
	private Date birth;//����
	private String profileIa1mge;//�����ʻ���
	private String role;//ȸ����� ��ȸ�� ��ȸ�� 
	private String realName;//�Ǹ�
	private int bankCode;//�����ڵ�
	private String accountNumber;//���¹�ȣ
	private int accountCi;//
	private int accountSeqNo;//
	private int totalPoint;//����Ʈ�հ�
	private int totalMileage;//���ϸ����հ�
	private int totalRecommend;//��õ�հ�
	private Date latestDate;//����������
	private Date createdDate;//���Գ�¥
	private String setRentCharge;//�����˸�����
	private String setNews;//�Ⱥξ˸�����
	private String setNewsFeed;//�����ǵ�˸�����
	private String setBroadcast;//���̺��۾˸�����
	private String setFriend;//ģ���˸�����
	private String setBob;//��ģ�� �˸�����
	private String SnsType;//sns���� ������ ����
	

	///Constructor
	public User() {
		
	}
	
	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getLongtitude() {
		return longtitude;
	}


	public void setLongtitude(int longtitude) {
		this.longtitude = longtitude;
	}


	public int getLatitude() {
		return latitude;
	}


	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getProfileIamge() {
		return profileIamge;
	}


	public void setProfileIamge(String profileIamge) {
		this.profileIamge = profileIamge;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
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


	public int getTotalPoint() {
		return totalPoint;
	}


	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}


	public int getTotalMileage() {
		return totalMileage;
	}


	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}


	public int getTotalRecommend() {
		return totalRecommend;
	}


	public void setTotalRecommend(int totalRecommend) {
		this.totalRecommend = totalRecommend;
	}


	public Date getLatestDate() {
		return latestDate;
	}


	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getSetRentCharge() {
		return setRentCharge;
	}


	public void setSetRentCharge(String setRentCharge) {
		this.setRentCharge = setRentCharge;
	}


	public String getSetNews() {
		return setNews;
	}


	public void setSetNews(String setNews) {
		this.setNews = setNews;
	}


	public String getSetNewsFeed() {
		return setNewsFeed;
	}


	public void setSetNewsFeed(String setNewsFeed) {
		this.setNewsFeed = setNewsFeed;
	}


	public String getSetBroadcast() {
		return setBroadcast;
	}


	public void setSetBroadcast(String setBroadcast) {
		this.setBroadcast = setBroadcast;
	}


	public String getSetFriend() {
		return setFriend;
	}


	public void setSetFriend(String setFriend) {
		this.setFriend = setFriend;
	}


	public String getSetBob() {
		return setBob;
	}


	public void setSetBob(String setBob) {
		this.setBob = setBob;
	}


	public String getSnsType() {
		return SnsType;
	}


	public void setSnsType(String snsType) {
		SnsType = snsType;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", longtitude=" + longtitude + ", latitude=" + latitude + ", gender="
				+ gender + ", phone=" + phone + ", birth=" + birth + ", profileIamge=" + profileIamge + ", role=" + role
				+ ", realName=" + realName + ", bankCode=" + bankCode + ", accountNumber=" + accountNumber
				+ ", accountCi=" + accountCi + ", accountSeqNo=" + accountSeqNo + ", totalPoint=" + totalPoint
				+ ", totalMileage=" + totalMileage + ", totalRecommend=" + totalRecommend + ", latestDate=" + latestDate
				+ ", createdDate=" + createdDate + ", setRentCharge=" + setRentCharge + ", setNews=" + setNews
				+ ", setNewsFeed=" + setNewsFeed + ", setBroadcast=" + setBroadcast + ", setFriend=" + setFriend
				+ ", setBob=" + setBob + ", SnsType=" + SnsType + "]";
	}


	
}

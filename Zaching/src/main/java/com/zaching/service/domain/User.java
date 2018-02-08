package com.zaching.service.domain;

import java.util.Date;

public class User {
	
	///Field
	private String authNum;//������ȣ


	private int userId;//����ID������
	private String email;//�̸���ID
	private String password;//�н�����
	private String password2;//�н����� ��ġ
	private String name;//�̸�
	private String address;//�ּ�
	private String longitude;//�浵
	private String latitude;//����
	private String gender;//���� =====>����'1' ����'2'
	private String phone;//����ó
	
	private String phone1;//����ó
	private String phone2;//����ó
	private String phone3;//����ó
	
	private String birth;//����
	private String profileImage;//�����ʻ���
	private String role;//ȸ����� ��ȸ�� ��ȸ�� ========> ��������'0' ��ȸ�� '1' ��ȸ�� '2'
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
	private String snsType;//sns���� ������ ����
	
	private String accessToken;//��ū����?
	private String refreshToken;//��ū����
	
	public User() {
		
	}
	
	
	public String getAccessToken() {
		return accessToken;
	}


	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}


	public String getRefreshToken() {
		return refreshToken;
	}


	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}


	public int getUserId() {
		return userId;
	}
	
	public String getAuthNum() {
		return authNum;
	}


	public void setAuthNum(String authNum) {
		this.authNum = authNum;
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
		return name.trim();
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


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
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
		/////////////// EL ���� ���� �߰� ///////////
		if(phone != null && phone.length() !=0 ){
			phone1 = phone.split("-")[0];
			phone2 = phone.split("-")[1];
			phone3 = phone.split("-")[2];
		}
	}
	

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}



	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}


	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}


	public String getBirth() {
		return birth.replace("-", "").trim();
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getRole() {
		return role.trim();
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getRealName() {
		return realName.trim();
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
		return snsType;
	}


	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}


	@Override
	public String toString() {
		return "User [authNum=" + authNum + ", userId=" + userId + ", email=" + email + ", password=" + password
				+ ", name=" + name + ", address=" + address + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", gender=" + gender + ", phone=" + phone + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
				+ phone3 + ", birth=" + birth + ", profileImage=" + profileImage + ", role=" + role + ", realName="
				+ realName + ", bankCode=" + bankCode + ", accountNumber=" + accountNumber + ", accountCi=" + accountCi
				+ ", accountSeqNo=" + accountSeqNo + ", totalPoint=" + totalPoint + ", totalMileage=" + totalMileage
				+ ", totalRecommend=" + totalRecommend + ", latestDate=" + latestDate + ", createdDate=" + createdDate
				+ ", setRentCharge=" + setRentCharge + ", setNews=" + setNews + ", setNewsFeed=" + setNewsFeed
				+ ", setBroadcast=" + setBroadcast + ", setFriend=" + setFriend + ", setBob=" + setBob + ", snsType="
				+ snsType + ", accessToken=" + accessToken + ", refreshToken=" + refreshToken + "]";
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
}

package com.zaching.service.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;



public class User {
	
	///Field
	private String authNum;//인증번호


	private int userId;//유저ID시퀀스
	private String email;//이메일ID
	private String password;//패스워드
	private String name;//이름
	private String address;//주소
	private String longitude;//경도
	private String latitude;//위도
	private String gender;//성별 =====>남자'1' 여자'2'
	private String phone;//연락처
	
	private String phone1;//연락처
	private String phone2;//연락처
	private String phone3;//연락처
	
	private String birth;//생일
	private MultipartFile uploadFile;//업로드 파일
	
	
	private String profileImage;//프로필사진
	private String role;//회원등급 정회원 준회원 ========> 계정정지'0' 준회원 '1' 정회원 '2'
	private String realName;//실명
	private String bankName;//은행명
	private String accountNumber;//계좌번호
	private int totalPoint;//포인트합계
	private int totalMileage;//마일리지합계
	private int totalRecommend;//추천합계
	private Date latestDate;//최종접속일
	private Date createdDate;//가입날짜
	private String setRentCharge;//월세알림설정
	private String setNews;//안부알림설정
	private String setNewsFeed;//뉴스피드알림설정
	private String setBroadcast;//라이브방송알림설정
	private String setFriend;//친구알림설정
	private String setBob;//밥친구 알림설정
	private String snsType;//sns계정 연동된 정보====> kakao '1'/ facebook'2' / naver '3' / google '4'
	
	private String accessToken;//토큰저장?
	private String refreshToken;//토큰갱신
	
	public User() {
		
	}
	
	
	public void setBankName(String bankName) {
		this.bankName = bankName;
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
		/////////////// EL 적용 위해 추가 ///////////
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
		
		if(birth ==null) {
			return"";
		}
		return birth.replace("-", " ").trim();
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
		if(realName != null) {
			return realName;
		} else {
			return realName;
		}		
	}


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
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
	
	


	public String getBankName() {
		return bankName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	

	@Override
	public String toString() {
		return "User [authNum=" + authNum + ", userId=" + userId + ", email=" + email + ", password=" + password
				+ ", uploadFile=" + uploadFile + ", name=" + name + ", address=" + address + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", gender=" + gender + ", phone=" + phone + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + ", birth=" + birth + ", profileImage=" + profileImage
				+ ", role=" + role + ", realName=" + realName + ", bankName=" + bankName + ", accountNumber="
				+ accountNumber + ", totalPoint=" + totalPoint + ", totalMileage=" + totalMileage + ", totalRecommend="
				+ totalRecommend + ", latestDate=" + latestDate + ", createdDate=" + createdDate + ", setRentCharge="
				+ setRentCharge + ", setNews=" + setNews + ", setNewsFeed=" + setNewsFeed + ", setBroadcast="
				+ setBroadcast + ", setFriend=" + setFriend + ", setBob=" + setBob + ", snsType=" + snsType
				+ ", accessToken=" + accessToken + ", refreshToken=" + refreshToken + "]";
	}


}

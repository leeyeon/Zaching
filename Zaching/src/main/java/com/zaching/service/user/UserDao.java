package com.zaching.service.user;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.User;

public interface UserDao {
	
	//회원가입 ok
	public void addUser(User user)throws Exception;
	
	//내정보조회  
	public User getUser(int userId)throws Exception;
	
	//로그인
	public User login(String email)throws Exception;
	
	//타임라인 보기
	public User getTimeLine(int userId)throws Exception;
	
	//회원리스트조회
	public List<User> listUser(Search search)throws Exception;
	
	//내정보수정 & 추가정보입력  & 회원탈퇴
	public void updateUser(User user)throws Exception;
	
	//totalCount
	public int getTotalCount(Search search)throws Exception;
	
	//유저계좌조회?
	public User getAccountUser(int userId)throws Exception;
	
	//알림설정
	public void updateNotice(User user)throws Exception;

	//패스워드찾기
	public String findPassword(String email);
	
	//추억지도 보기
	public List<Newsfeed> memoryMap(int userId)throws Exception;
	
	//이메일 인증성공시 정회원으로 업데이트
	public int updateRole(User user)throws Exception;
	
	//이메일 중복체크
	public int checkSignup(String email)throws Exception;
	
	//sns계정 로그인 정보 DB로 슝슝
	public void snsAddUser(User user)throws Exception;
	
	//sns계정 로그인 or 회원가입 여부 판단
	public int snsCheck(String email, String snsType)throws Exception;
	
	//로그인 기록 남기기
	public void latestLogin(int userId)throws Exception;
	
	public void updateAccountToken(String token, int userId) throws Exception;
	
	public String getAccountToken(int userId) throws Exception;
	
	// 안드로이드 알람 토큰 get. set
	public String getFCMToken(int userId) throws Exception;

	public void updateFCMToken(int userId, String fcmToken) throws Exception;
}

package com.zaching.service.user;


import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;

public interface UserService {
	
	//회원가입
	public void addUser(User user)throws Exception;
	
	//타임라인보기
	public User getTimeLine(int userId)throws Exception;
	
	//내정보조회 
	public User getUser(int userId)throws Exception;
	
	//로그인
	public User login(String email)throws Exception;
	
	//user계좌정보 조회
    public User getAccountUser(int userId)throws Exception;
	
	//회원정보리스트(사이트관리에서 사용)
	public Map<String,Object>listUser(Search search)throws Exception;

	//나만의 추억지도 보기
	public Map<String, Object>memoryMap(Search search)throws Exception;
	
	//내정보수정 == 추가정보입력
    public void updateUser(User user)throws Exception;
    
	//패스워드찾기
    public void findPassword(String password)throws Exception;
    
	//회원탈퇴
    public void deleteUser(User user)throws Exception;
	
    //알림수신설정
    public  void updateNotice(User user)throws Exception;
    
    // 이매일 ID 중복 확인
 	public boolean checkSignup(String email) throws Exception;


    //이메일 전송
 	public void sendMail(String email, String authNum)throws Exception;
 	
 	//이메일 인증시 정회원으로 등급 up
 	public void updateRole(User user)throws Exception;
 	
 	//sns로그인 정보 DB로 슝슝
 	public void snsAddUser(User user)throws Exception;

	public String updateGetAccountToken(String token, int userId) throws Exception;
	
 	public void setFCMToken(int userId, String fcmToken) throws Exception;
 	
 	public String getFCMToken(int userId) throws Exception;

}

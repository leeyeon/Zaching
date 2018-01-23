package com.zaching.service.user;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;

public interface UserDao {
	
	//회원가입
	public void addUser(User user)throws Exception;
	
	//내정보조회  & 로그인 SELECT 
	public User getUser(int userId)throws Exception;
	
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
	
	

}

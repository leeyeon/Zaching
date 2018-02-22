package com.zaching.service.user;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.User;

public interface UserDao {
	
	//ȸ������ ok
	public void addUser(User user)throws Exception;
	
	//��������ȸ  
	public User getUser(int userId)throws Exception;
	
	//�α���
	public User login(String email)throws Exception;
	
	//Ÿ�Ӷ��� ����
	public User getTimeLine(int userId)throws Exception;
	
	//ȸ������Ʈ��ȸ
	public List<User> listUser(Search search)throws Exception;
	
	//���������� & �߰������Է�  & ȸ��Ż��
	public void updateUser(User user)throws Exception;
	
	//totalCount
	public int getTotalCount(Search search)throws Exception;
	
	//����������ȸ?
	public User getAccountUser(int userId)throws Exception;
	
	//�˸�����
	public void updateNotice(User user)throws Exception;

	//�н�����ã��
	public String findPassword(String email);
	
	//�߾����� ����
	public List<Newsfeed> memoryMap(int userId)throws Exception;
	
	//�̸��� ���������� ��ȸ������ ������Ʈ
	public int updateRole(User user)throws Exception;
	
	//�̸��� �ߺ�üũ
	public int checkSignup(String email)throws Exception;
	
	//sns���� �α��� ���� DB�� ����
	public void snsAddUser(User user)throws Exception;
	
	//sns���� �α��� or ȸ������ ���� �Ǵ�
	public int snsCheck(String email, String snsType)throws Exception;
	
	//�α��� ��� �����
	public void latestLogin(int userId)throws Exception;
	
	public void updateAccountToken(String token, int userId) throws Exception;
	
	public String getAccountToken(int userId) throws Exception;
	
	// �ȵ���̵� �˶� ��ū get. set
	public String getFCMToken(int userId) throws Exception;

	public void updateFCMToken(int userId, String fcmToken) throws Exception;
}

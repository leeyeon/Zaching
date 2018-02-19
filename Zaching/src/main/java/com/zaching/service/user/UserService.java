package com.zaching.service.user;


import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;

public interface UserService {
	
	//ȸ������
	public void addUser(User user)throws Exception;
	
	//Ÿ�Ӷ��κ���
	public User getTimeLine(int userId)throws Exception;
	
	//��������ȸ 
	public User getUser(int userId)throws Exception;
	
	//�α���
	public User login(String email)throws Exception;
	
	//user�������� ��ȸ
    public User getAccountUser(int userId)throws Exception;
	
	//ȸ����������Ʈ(����Ʈ�������� ���)
	public Map<String,Object>listUser(Search search)throws Exception;

	//������ �߾����� ����
	public Map<String, Object>memoryMap(Search search)throws Exception;
	
	//���������� == �߰������Է�
    public void updateUser(User user)throws Exception;
    
	//�н�����ã��
    public void findPassword(String password)throws Exception;
    
	//ȸ��Ż��
    public void deleteUser(User user)throws Exception;
	
    //�˸����ż���
    public  void updateNotice(User user)throws Exception;
    
    // �̸��� ID �ߺ� Ȯ��
 	public boolean checkSignup(String email) throws Exception;


    //�̸��� ����
 	public void sendMail(String email, String authNum)throws Exception;
 	
 	//�̸��� ������ ��ȸ������ ��� up
 	public void updateRole(User user)throws Exception;
 	
 	//sns�α��� ���� DB�� ����
 	public void snsAddUser(User user)throws Exception;

	public String updateGetAccountToken(String token, int userId) throws Exception;
	
 	public void setFCMToken(int userId, String fcmToken) throws Exception;
 	
 	public String getFCMToken(int userId) throws Exception;

}

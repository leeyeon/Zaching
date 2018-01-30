package com.zaching.service.user;

import java.util.List;

import com.zaching.common.domain.Search;
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
	public List<User> memoryMap(Search search)throws Exception;
	
	//�̸��� �ߺ�üũ
	public int checkEmail(String email)throws Exception;
	
}

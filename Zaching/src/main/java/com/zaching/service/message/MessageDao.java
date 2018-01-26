package com.zaching.service.message;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;

public interface MessageDao {
	
	//�޼��� �ۼ�
	public void addMessage(Message message) throws Exception;
	
	//�޼��� Ȯ��
	public Message getMessage(int messageId) throws Exception;
	
	//�޼��� ����
	public void deleteMessage(int messageId) throws Exception;
	
	//�޼��� ���
	public List<Message> listMessage(Search search) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;
	

}

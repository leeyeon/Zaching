package com.zaching.service.message;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Message;

public interface MessageService {
	
	//�޼��� �ۼ�
	public void addMessage(Message message) throws Exception;
	
	//�޼��� Ȯ��
	public Message getMessage(String messageId) throws Exception;
	
	//�޼��� ����
	public void deleteMessage(Message message) throws Exception;
	
	//�޼��� ���
	public Map<String,Object> listMessage(Search search) throws Exception;
	

}

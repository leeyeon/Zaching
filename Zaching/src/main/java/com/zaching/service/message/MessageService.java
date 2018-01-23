package com.zaching.service.message;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Message;

public interface MessageService {
	
	//메세지 작성
	public void addMessage(Message message) throws Exception;
	
	//메세지 확인
	public Message getMessage(String messageId) throws Exception;
	
	//메세지 삭제
	public void deleteMessage(Message message) throws Exception;
	
	//메세지 목록
	public Map<String,Object> listMessage(Search search) throws Exception;
	

}

package com.zaching.service.message;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;

public interface MessageDao {
	
	//메세지 작성
	public void addMessage(Message message) throws Exception;
	
	//메세지 확인
	public Message getMessage(int messageId) throws Exception;
	
	//메세지 삭제
	public void deleteMessage(int messageId) throws Exception;
	
	//메세지 목록
	public List<Message> listMessage(Search search) throws Exception;
	
	//totalCount
	public int getTotalCount(Search search) throws Exception;
	

}

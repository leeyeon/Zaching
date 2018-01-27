package com.zaching.service.message.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;
import com.zaching.service.message.MessageDao;
import com.zaching.service.message.MessageService;

@Service("messageServiceImpl")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	@Qualifier("messageDaoImpl")
	private MessageDao messageDao;
	
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao=messageDao;
		
	}
	
	public MessageServiceImpl() {
		
	}

	@Override
	public void addMessage(Message message) throws Exception {
		messageDao.addMessage(message);
	}

	@Override
	public Map<String, Object> listMessage(Search search) throws Exception {
		List<Message> list=messageDao.listMessage(search);
		int totalCount=messageDao.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void deleteMessage(int messageId) throws Exception {
		messageDao.deleteMessage(messageId);
		
	}

	@Override
	public Message getMessage(int messageId) throws Exception {
		return messageDao.getMessage(messageId);
	}
	

}

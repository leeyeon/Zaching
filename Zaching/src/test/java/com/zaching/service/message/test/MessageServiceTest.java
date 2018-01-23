package com.zaching.service.message.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Message;
import com.zaching.service.friend.FriendService;
import com.zaching.service.message.MessageService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class MessageServiceTest {
	
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	
	private int friendId=123;
	private int messageId=4;
	private int userId=6;
	

	@Test
	public void testAddMessage()throws Exception{
		
		System.out.println("zzzz");
		Message message=new Message();
//		message.setMessageId(messageId);
//		message.setFriendId(friendId);
//		message.setUserId(userId);
		message.setContent("뿌에에에엥");
		
		
		
		messageService.addMessage(message);
		
//		Assert.assertEquals("키야오오오오오", message.getContent());
		
		
	}
	

	
}
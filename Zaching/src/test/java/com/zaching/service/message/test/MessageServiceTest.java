package com.zaching.service.message.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Message;
import com.zaching.service.friend.FriendService;
import com.zaching.service.message.MessageService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class MessageServiceTest {

	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;

	private int friendId = 5;
	private int messageId = 28;

//	 @Test
	public void testAddMessage() throws Exception {

//		System.out.println("여기까지 왔어요");

		Message message = new Message();
		message.setUserId(6);
		message.setFriendId(friendId);
		message.setContent("HI");

		messageService.addMessage(message);

		System.out.println(message);
		
		System.out.println("==========addMessage완료===========");

	}

//	 @Test
	public void testdeleteMessage() throws Exception {
		 
		 Message message=new Message();
		 message.setMessageId(messageId);
		 
		 
		messageService.deleteMessage(messageId);
		
//		System.out.println("메세지 삭제가 완료되었습니다");

	}

//	@Test
	public void testgetMessage() throws Exception {

//		System.out.println("getMessage 하기전.....");
		Message message = new Message();

		message = messageService.getMessage(messageId);

		System.out.println(message);
		
//		System.out.println("getMessage 하고난후.....");

	}
	
	@Test
	public void testlistMessage() throws Exception{
		
		Search search=new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);

		
		Map<String , Object> map=messageService.listMessage(search);
		List<Message> list=(List<Message>)map.get("list");
		
		for(Message message : list ) {
			System.out.println(message);
		}
		int totalCount=(int)map.get("totalCount");
		System.out.println("list Size::"+list.size()+"&totalCount::"+totalCount);
		
//		System.out.println("==================listMessage입니당================");
		
	}

}
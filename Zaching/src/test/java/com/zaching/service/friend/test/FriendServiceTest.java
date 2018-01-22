package com.zaching.service.friend.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.service.domain.Friend;
import com.zaching.service.friend.FriendService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class FriendServiceTest {
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	

	@Test
	public void testAddFriend()throws Exception{
		Friend friend=new Friend();
		friend.setName("testName");
		friend.setSenderUserName("senderUserName");
		friend.setGetUserName("getUserName");
		
		
		friendService.addFriend(friend);
		
		
		
		Assert.assertEquals("testName",friend.getName());
		Assert.assertEquals("senderUserName",friend.getSenderUserName());
		Assert.assertEquals("getUserName",friend.getGetUserName());
		
	}
	

	
}
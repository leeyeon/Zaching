package com.zaching.service.friend.test;

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
	
	private int friendId=5;
	private int id=3;
	private int status=1;

//	@Test
	public void testAddFriend()throws Exception{
		
		System.out.println("addFriendÇÏ±âÀü");
		
		Friend friend=new Friend();
		friend.setUserId(25);
//		friend.setName("±è»ó¹Î");
		friend.setId(id);
		friend.setFriendId(friendId);
//		friend.setProfileImage("zzzz");
		
		
		friendService.addFriend(friend);
		
		System.out.println(friend);
		
		System.out.println("addFriend³¡³ª¾¸");
		
		
	}
	
//	@Test
	public void testGetFreind() throws Exception{
		
		Friend friend=new Friend();
		
		friend = friendService.getFriend(id);
		
		
		
		System.out.println(friend);
		
		System.out.println("getFriend³¡");
		
	}
//	@Test
	public void testupdateFriend() throws Exception{
		Friend friend=friendService.getFriend(id);
		
		System.out.println(""+friend);
		
		friend.setStatus(status);
		
		friendService.updateFriend(friend);
		
		System.out.println("update ¿Ï·á");
		
	}
	
//	@Test
	public void testdeleteFriend() throws Exception{
		Friend friend=new Friend();
		friend.setId(id);
		
		friendService.deleteFreind(id);
		
		
	}
	
	@Test
	public void testlistFriend() throws Exception{
		Search search=new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		Map<String , Object> map=friendService.listFriend(search);
		List<Friend> list=(List<Friend>)map.get("list");
		
		for(Friend friend:list) {
			System.out.println(friend);
			
		}
		int totalCount=(int)map.get("totalCount");
		System.out.println("list:size::"+list.size()+"&totalCount::"+totalCount);
		
		System.out.println("=================listFriend=============");
	}
	

	
}
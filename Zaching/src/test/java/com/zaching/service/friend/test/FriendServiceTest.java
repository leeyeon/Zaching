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
	
	private int friendId=9;
	private int id=39;
	private int status=0;
	private int userId=34;

//	@Test
	public void testAddFriend()throws Exception{
		
		System.out.println("addFriend하기전");
		
		Friend friend=new Friend();
//		friend.setId(id);
		friend.setUserId(friendId);
		friend.setFriendId(userId);
//		friend.setStatus(status);
		
		
		friendService.addFriend(friend);
		
		System.out.println(friend);
		
		System.out.println("addFriend끝나씀");
		
		
	}
	
	
//	@Test
	public void testGetFreind() throws Exception{
		
		Friend friend=new Friend();
		
		friend = friendService.getFriend(34);
		friend=friendService.getFriend(1);
		
		
		
		System.out.println(friend);
		
		System.out.println("getFriend끝");
		
	}
//	@Test
	public void testupdateFriend() throws Exception{
		Friend friend=friendService.getFriend(userId);
		
		System.out.println(""+friend);
		
		friend.setStatus(status);
		
		friendService.updateFriend(friend);
		
		System.out.println("update 완료");
		
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
//	@Test
	public void testenterFriend() throws Exception{
		System.out.println("enterFriend하기전========");
		Friend friend=new Friend();
		
		friend.setUserId(userId);
		friend.setFriendId(friendId);
		
		friendService.enterFriend(friend);
		
		System.out.println(friend);
		
		System.out.println("enterFriend끝=========");
		
	}
	
	
//	@Test
	public void testacceptFriend() throws Exception{
		
	}
	

	
}
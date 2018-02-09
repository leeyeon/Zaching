package com.zaching.service.user.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", 
		"classpath:config/context-transaction.xml" })
public class UserServiceTest {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	 //@Test
	public void testAddUser() throws Exception {

		// 간편회원가입으로 이름,이메일,패스워드 정보만 받음.
		// 간편회원가입의 회원등급은  준회원='0' 정회원='1' 계정정지='2' 회원탈퇴='3'
		// sns계정으로 회원가입시 snsType 비연동='1',연동='2'

		User user = new User();
		user.setName("이연희");
		user.setPassword("bbqchickengood1");
		user.setEmail("yeonhee@gmail.com");
		user.setRole("2");
		user.setSnsType("1");

		userService.addUser(user);

		// ==> console 확인
		System.out.println("addUser 정보===>" + user);

	}

	//@Test
	public void testGetUser() throws Exception {

		User user = new User();

		user = userService.getUser(9);

		System.out.println("getUser===>" + user);

		// ==> console 확인
		System.out.println(user);

	}
	
	
	@Test
	public void testgetTimeLine() throws Exception {

		User user = new User();

		user = userService.getTimeLine(8);

		System.out.println("getTimeLine===>" + user);

	}
	
	//@Test
		public void testGetUserListAll() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			Map<String, Object> map = userService.listUser(search);

			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(3, list.size());

			// ==> console 확인
			// System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);

			System.out.println("=======================================");

			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("1");
			search.setSearchKeyword("소현태");
			map = userService.listUser(search);

			list = (List<Object>) map.get("list");
			Assert.assertEquals(1, list.size());


			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);
			
		}
		
		// @Test
		public void testUpdateUser() throws Exception {

			User user = userService.getUser(124);

			System.out.println("" + user);

			user.setName("김정은");
			user.setBirth("1996-03-03");
			user.setPhone("010-8680-7505");
			user.setAddress("서초구");
			user.setGender("2");
			user.setEmail("change@change.com");
			user.setPassword("a1a2w4d");
			user.setProfileImage("사진이름.jpg");
			user.setRealName("이정은");
			//user.setBankCode(013);
			//user.setAccountCi(11111);
			user.setAccountNumber("02480204255200");
			//user.setAccountSeqNo(1234);
			user.setTotalMileage(5000);
			user.setTotalPoint(500);

			userService.updateUser(user);

			user = userService.getUser(124);

			System.out.println("updateUser:: " + user);
		
		}


	// @Test
	public void testGetAccountUser() throws Exception {
		User user = userService.getUser(6);

		System.out.println("UpdateAccountUser::" + user);

		user.setRealName("이정은");
		//user.setBankCode(011);
		//user.setAccountCi(11111);
		user.setAccountNumber("02480204255200");
		//user.setAccountSeqNo(1234);
		user.setTotalMileage(5000);
		user.setTotalPoint(500);

		userService.updateUser(user);

		user = userService.getAccountUser(6);

		System.out.println("계좌정보등록::==>" + user);
	}

 
	//@Test
	public void testUpdateNotice() throws Exception {

		User user = userService.getUser(6);

		System.out.println("" + user);

	
		user.setSetRentCharge("N");
		user.setSetNews("N");
		user.setSetNewsFeed("N");
		user.setSetBroadcast("N");
		user.setSetFriend("Y");
		user.setSetBob("Y");
		
		userService.updateNotice(user);
		
		user = userService.getUser(6);
		
		System.out.println("updateNotice:: " + user);
	
	}
	
	public void testmemoryMap() throws Exception{
		
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("소현태");
	 	Map<String,Object> map = userService.memoryMap(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=================이얍======================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.listUser(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(""+totalCount);
		
		
	} 
	

}
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

		// ����ȸ���������� �̸�,�̸���,�н����� ������ ����.
		// ����ȸ�������� ȸ�������  ��ȸ��='0' ��ȸ��='1' ��������='2' ȸ��Ż��='3'
		// sns�������� ȸ�����Խ� snsType �񿬵�='1',����='2'

		User user = new User();
		user.setName("�̿���");
		user.setPassword("bbqchickengood1");
		user.setEmail("yeonhee@gmail.com");
		user.setRole("2");
		user.setSnsType("1");

		userService.addUser(user);

		// ==> console Ȯ��
		System.out.println("addUser ����===>" + user);

	}

	//@Test
	public void testGetUser() throws Exception {

		User user = new User();

		user = userService.getUser(9);

		System.out.println("getUser===>" + user);

		// ==> console Ȯ��
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

			// ==> console Ȯ��
			// System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);

			System.out.println("=======================================");

			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("1");
			search.setSearchKeyword("������");
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

			user.setName("������");
			user.setBirth("1996-03-03");
			user.setPhone("010-8680-7505");
			user.setAddress("���ʱ�");
			user.setGender("2");
			user.setEmail("change@change.com");
			user.setPassword("a1a2w4d");
			user.setProfileImage("�����̸�.jpg");
			user.setRealName("������");
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

		user.setRealName("������");
		//user.setBankCode(011);
		//user.setAccountCi(11111);
		user.setAccountNumber("02480204255200");
		//user.setAccountSeqNo(1234);
		user.setTotalMileage(5000);
		user.setTotalPoint(500);

		userService.updateUser(user);

		user = userService.getAccountUser(6);

		System.out.println("�����������::==>" + user);
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
	 	search.setSearchKeyword("������");
	 	Map<String,Object> map = userService.memoryMap(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=================�̾�======================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.listUser(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(""+totalCount);
		
		
	} 
	

}
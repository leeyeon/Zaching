package com.zaching.service.bob.test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Fee;
import com.zaching.service.domain.Participant;

/*
 * 작성자 : 이연희
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class BobServiceTest {

	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	/* 방장 */
	private int userId = 6;
	/* 참여자1 */
	private int part1 = 5;
	/* 참여자2 */
	private int part2 = 7;
	/* default 우리지금만나 */
	private String category = "B01";
	/* 방 ID */
	private int bobId = 4;
	
	//@Test
	public void addBobB01() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("참여자등록됬는지 확인하는 방");
		bob.setContent("우오오오왕");
		bob.setWrittenUserId(userId);
		
		bobService.addBob(bob);
	}
	
	//@Test
	public void addBobB03() throws Exception {

		Calendar calendar = Calendar.getInstance();
		Date abc = calendar.getTime();
		calendar.set(calendar.DATE, 4);
		Date date = calendar.getTime();
		
		Bob bob = new Bob();
		bob.setCategory("B03");
		bob.setTitle("계모임방입니다");
		bob.setContent("환영합니당");
		bob.setWrittenUserId(userId);
		bob.setFee(20000);
		//bob.setFeeDate(date);
		
		System.out.println(bob);
		
		bobService.addBob(bob);
	}
	
	//@Test
	public void listBob() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		search.setCategory("B01");
		
		Map<String, Object> map = bobService.listBob(search);
		List<Bob> list = (List<Bob>)map.get("list");
		
		for (Bob bob : list) {
			System.out.println(bob);
		}
		
		int totalCount = (int)map.get("totalCount");
		
		System.out.println("list Size :: "+list.size()+" &totalCount::"+totalCount);
	}
	
	//@Test
	public void getBob() throws Exception {
		Map<String, Object> map = bobService.getBob(11, "B03", 0);
		System.out.println(map.get("bob").toString());
		
		List<Participant> list = (List<Participant>)map.get("participant");
		for (Participant participant : list) {
			System.out.println(participant);
		}
		
		List<Fee> feeList = (List<Fee>)map.get("fee");
		for (Fee fee : feeList) {
			System.out.println(fee);
		}
	}
	
	//@Test
	public void updateBob() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("밥친구방()");
		bob.setContent("안녕하세요");
		bob.setWrittenUserId(userId);
		bob.setBobId(bobId);
		bob.setLocationName("아차산역");
		bob.setLatitude("37.552121");
		bob.setLongitude("127.089627");
		
		bobService.updateBob(bob);
	}
	
	//@Test
	public void enterBob() throws Exception {
		//bobService.enterBob(part1, bobId);
		bobService.enterBob(part1, 11);
	}

	//@Test
	public void inviteBob() throws Exception {
		
		List<Integer> listUser = new ArrayList<Integer>();
		listUser.add(123);
		
		bobService.inviteBob(listUser, bobId);
	}
	
	//@Test
	public void deleteBob() throws Exception {
		bobService.deleteBob(bobId);
	}

	//@Test
	public void setFeeBob() throws Exception {
		bobService.setFeeBob(7, true);
	}
	
	//@Test
	public void payFeeBob() throws Exception {
		
		Fee fee = new Fee();
		fee.setPaidFee(20000);
		fee.setParticipantId(15);
		
		bobService.payFeeBob(fee);
	}
	
	//@Test
	public void test() throws Exception {
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		String monthStr = "";
		
		System.out.println(calendar.get(Calendar.MONTH));
		
		if(month < 10) {
			monthStr = "0"+month;
		} else {
			monthStr = ""+month;
		}
		
		System.out.println(monthStr);
		
	}
}
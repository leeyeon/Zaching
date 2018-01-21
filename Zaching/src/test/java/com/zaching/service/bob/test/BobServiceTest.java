package com.zaching.service.bob.test;

import java.text.SimpleDateFormat;
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
	
	@Test
	public void addBobB03() throws Exception {
		Bob bob = new Bob();
		bob.setCategory("B03");
		bob.setTitle("주기적으로 만나");
		bob.setContent("우오오오왕");
		bob.setWrittenUserId(userId);
		bob.setFee(20000);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		
		System.out.println(date);
		//bob.setFeeDate("");
		//bobService.addBob(bob);
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
		Map<String, Object> map = bobService.getBob(4, "B01");
		System.out.println(map.get("bob").toString());
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
		bobService.enterBob(part2, bobId);
	}

	public void inviteBob() throws Exception {
		
	}
	
	//@Test
	public void deleteBob() throws Exception {
		bobService.deleteBob(bobId);
	}

	//@Test
	public void setFeeBob() throws Exception {
		bobService.setFeeBob(7, true);
	}
	
	public void payFeeBob() throws Exception {
		
	}
}
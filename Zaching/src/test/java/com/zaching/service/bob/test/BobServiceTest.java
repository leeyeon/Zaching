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
 * �ۼ��� : �̿���
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
	
	/* ���� */
	private int userId = 6;
	/* ������1 */
	private int part1 = 5;
	/* ������2 */
	private int part2 = 7;
	/* default �츮���ݸ��� */
	private String category = "B01";
	/* �� ID */
	private int bobId = 4;
	
	//@Test
	public void addBobB01() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("�����ڵ�ω���� Ȯ���ϴ� ��");
		bob.setContent("���������");
		bob.setWrittenUserId(userId);
		
		bobService.addBob(bob);
	}
	
	@Test
	public void addBobB03() throws Exception {
		Bob bob = new Bob();
		bob.setCategory("B03");
		bob.setTitle("�ֱ������� ����");
		bob.setContent("���������");
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
		bob.setTitle("��ģ����()");
		bob.setContent("�ȳ��ϼ���");
		bob.setWrittenUserId(userId);
		bob.setBobId(bobId);
		bob.setLocationName("�����꿪");
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
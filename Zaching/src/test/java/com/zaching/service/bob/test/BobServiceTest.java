package com.zaching.service.bob.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;

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
	/* default 우리지금만나 */
	private String category = "B01";
	
	@Test
	public void addBobB01() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("밥친구방1");
		bob.setContent("안녕하세요");
		bob.setWrittenUserId(userId);
		
		bobService.addBob(bob);
	}
	
	public void listBob() throws Exception {
		
	}
	
	public void getBob() throws Exception {
		
	}
	
	public void updateBob() throws Exception {
		
	}
	
	public void enterBob() throws Exception {
		
	}
	
	public void inviteBob() throws Exception {
		
	}
	
	public void deleteBob() throws Exception {
		
	}

	public void setFeeBob() throws Exception {
		
	}
	
	public void payFeeBob() throws Exception {
		
	}
}
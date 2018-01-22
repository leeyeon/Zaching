package com.zaching.service.newsfeed.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class NewsfeedServiceTest {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	//@Test
	public void testAddNewsfeed() throws Exception{
		Newsfeed newsfeed = new Newsfeed();
		
		newsfeed.setCategoryCode("0");
		newsfeed.setContent("안녕하세여");
		newsfeed.setCountLikey(15);
		newsfeed.setCountReply(15);
		newsfeed.setFileName("동영상");
		newsfeed.setLocationName("비트");
		newsfeed.setLocationX(159);
		newsfeed.setLocationY(156);
		newsfeed.setNewsfeedID(1);
		newsfeed.setPrivacyBound("0");
		newsfeed.setRegDate("93-06-10");
		newsfeed.setStatus("0");
		newsfeed.setUserID(5);
		
		System.out.println(newsfeed);
		
		
		newsfeedService.addNewsfeed(newsfeed);
		
		Assert.assertEquals("안녕하세여", newsfeed.getContent());
	}
	
	@Test
	public void testListAll() throws Exception{
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = newsfeedService.listNewsfeed(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	Integer totalCount = (Integer)map.get("count");
	 	System.out.println(totalCount);
	 	
	 	
	}
	
	
	
}
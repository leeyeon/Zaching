package com.zaching.service.newsfeed.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedService;

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
	public void testListNewsfeed() throws Exception{
		Search search = new Search();
		search.setCategory("V01");
		List<Newsfeed> list = newsfeedService.listNewsfeeds(search);
		System.out.println(list);
	}
	
	@Test
	public void testUpdateNewsfeed() throws Exception{
		newsfeedService.updateCountLike(4);
		
		//newsfeedService.addLikeBlind(4, 6, "0");
		Assert.assertEquals(20, newsfeedService.getCountLike(4));
	}
	
}
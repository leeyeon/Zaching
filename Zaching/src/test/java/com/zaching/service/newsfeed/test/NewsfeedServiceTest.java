package com.zaching.service.newsfeed.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Page;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Test
	public void testListNewsfeed() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setCategory("V01");
		search.setPageSize(pageSize);
		Map<String, Object> map = newsfeedService.listNewsfeed(search);
		//System.out.println(map.get("list"));
		//List<Newsfeed> list = newsfeedService.listNewsfeeds(search);
		//User user = userService.getUser(userId);
		// Business logic 수행

		System.out.println(((List)map.get("list")).size());
		System.out.println(map.get("list"));
		System.out.println((Integer)map.get("totalCount"));
		System.out.println("==========================");
		
		search.setCurrentPage(2);
		search.setCategory("V01");
		search.setPageSize(pageSize);
		map = newsfeedService.listNewsfeed(search);
		//System.out.println(map.get("list"));
		//List<Newsfeed> list = newsfeedService.listNewsfeeds(search);
		//User user = userService.getUser(userId);
		// Business logic 수행

		System.out.println(((List)map.get("list")).size());
		System.out.println(map.get("list"));
		System.out.println((Integer)map.get("totalCount"));
	}
	
	//@Test
	public void testUpdateNewsfeed() throws Exception{
		newsfeedService.updateCountLike(4);
		
		//newsfeedService.addLikeBlind(4, 6, "0");
		Assert.assertEquals(20, newsfeedService.getCountLike(4));
	}
	
	
	
}
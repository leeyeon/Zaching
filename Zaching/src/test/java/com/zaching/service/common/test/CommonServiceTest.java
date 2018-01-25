package com.zaching.service.common.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;

/*
 * 작성자 : 이연희
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class CommonServiceTest {

	@Autowired
	@Qualifier("commonServiceImpl")
	CommonService commonService;
	
	@Test
	public void addComment() throws Exception {
		Comment comment = new Comment();
		comment.setCategory("B00");
		comment.setRoomId(11);
		comment.setUserId(6);
		comment.setContent("테스트댓글3");
		
		comment = commonService.addComment(comment);
		System.out.println(comment);
	}
	
	//@Test
	public void deleteComment() throws Exception {
		commonService.deleteComment(1);
	}
	
	//@Test
	public void listComment() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		search.setCategory("B00");
		
		String categoryCode = "B00";
		int roomId = 11;
		Map<String, Object> map = commonService.listComment(search, categoryCode, roomId);
		List<Comment> list = (List<Comment>)map.get("list");
		
		for (Comment comment : list) {
			System.out.println(comment);
		}
	}
}
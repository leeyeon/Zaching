package com.zaching.web.newsfeed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;
import com.zaching.service.newsfeed.NewsfeedService;

@RestController
@RequestMapping("/newsfeed/*")
public class NewsfeedRestController {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public NewsfeedRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addComment", method=RequestMethod.GET)
	public Comment addComment(@RequestBody Comment comment) throws Exception{
		System.out.println("newsfeed/json/addComment");

		return null;
	}
	
	@RequestMapping(value="json/updateComment", method=RequestMethod.GET)
	public Comment updateComment(@RequestBody Comment comment) throws Exception{
		System.out.println("newsfeed/json/updateComment");
		
		return commonService.addComment(comment);
	}
	
	@RequestMapping(value="json/updateLikey/{newsfeedId}/{userId}", method=RequestMethod.GET)
	public int updateLikey(@RequestParam int newsfeedId, @RequestParam int userId, @RequestParam int countLikey) throws Exception{
		System.out.println("newsfeed/json/updateLikey");
		newsfeedService.updateCountLike(newsfeedId);
		newsfeedService.addLikeBlind(newsfeedId, userId);
		
		return countLikey+1;
	}
	
	
	
	
	

}

package com.zaching.web.newsfeed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.service.newsfeed.NewsfeedService;

@RestController
@RequestMapping("/newsfeed/*")
public class NewsfeedRestController {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	public NewsfeedRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getComment/{roomId}", method=RequestMethod.GET)
	public String getComment() {
		return null;
	}
	
	

}

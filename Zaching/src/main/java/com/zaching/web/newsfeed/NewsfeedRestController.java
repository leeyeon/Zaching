package com.zaching.web.newsfeed;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Newsfeed;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
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
	
	@RequestMapping(value="json/updateLikey/{userId}/{status}", method=RequestMethod.POST)
	public int updateLikey(@RequestBody Newsfeed newsfeed, @PathVariable int userId, @PathVariable String status) throws Exception{
		System.out.println("newsfeed/json/updateLikey");
		
		int newsfeedId = newsfeed.getNewsfeedId();
		System.out.println(newsfeedService.getLikeUser(newsfeedId, userId, status));
		if(newsfeedService.getLikeUser(newsfeedId, userId, status)>0) {
			System.out.println("if");
			newsfeedService.cancelCountLike(newsfeedId);
			newsfeedService.deleteLikeBlind(newsfeedId, userId, status);
			
			return newsfeed.getCountLikey()-1;
		}
		else {
			newsfeedService.updateCountLike(newsfeed.getNewsfeedId());
			newsfeedService.addLikeBlind(newsfeed.getNewsfeedId(), userId, status);
			
			//newsfeedService.getCountLike(newsfeed.getnewsfeedId());
			
			return newsfeed.getCountLikey()+1;
		}
		
	}
	
	@RequestMapping(value="json/listNewsfeed")
	public List listNewsfeed(@RequestBody String pageInfo) throws Exception {
		System.out.println("newsfeed/json/listNewsfeed");
		System.out.println(pageInfo);
		String[] info = pageInfo.split("&");
		String[] page = info[0].split("=");
		String[] category = info[1].split("=");
		
		Search search = new Search();
		search.setCurrentPage(Integer.parseInt(page[1]));
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setCategory(category[1]);
		search.setPageSize(pageSize);
		Map<String, Object> map = newsfeedService.listNewsfeed(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("list :: "+map.get("list"));
		System.out.println("listSize :: "+((List)map.get("list")).size());
		
		return (List)map.get("list");
	}
	
}

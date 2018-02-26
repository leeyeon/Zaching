package com.zaching.web.newsfeed;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.User;
import com.zaching.service.friend.FriendService;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;


@Controller
@RequestMapping("/newsfeed/*")
public class NewsfeedController {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Autowired
	@Qualifier("friendServiceImpl")

	private FriendService friendService;
	
	public NewsfeedController() {
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping(value="addNewsfeed", method=RequestMethod.POST)
	public String addNewsfeed(@ModelAttribute("search") Search search, @ModelAttribute("newsfeed") Newsfeed newsfeed, @ModelAttribute("notice") Notice notice, Model model, HttpServletRequest request) throws Exception{
		System.out.println("addNewsfeed()");
		System.out.println("²ó¾Æ¾Æ¾Ó"+newsfeed);
		
		if(newsfeed.getFile().getOriginalFilename() != null) {
			String fileName = newsfeed.getFile().getOriginalFilename();
			newsfeed.setFileName(fileName);
			
			File file = new File("C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\"+fileName);
			
			newsfeed.getFile().transferTo(file);
		}
		
		newsfeedService.addNewsfeed(newsfeed);
		
		User user = userService.getUser(newsfeed.getUserId());
		
		notice.setSenderId(newsfeed.getUserId());
		notice.setCategory("N00");
		notice.setName(user.getName());
		notice.setBobId(newsfeed.getNewsfeedId());
		commonService.addNotice(notice);

		search.setSearchKeyword(String.valueOf(notice.getSenderId()));
		Map<String, Object> map = friendService.listFriend(search);
		
		for(int i=0; i< ((List)map.get("list")).size();i++) {
			Friend friend = (Friend)((List)map.get("list")).get(i);
			notice.setUserId(friend.getFriendId());

			commonService.addNoticeTarget(notice);
		}
		

		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="deleteNewsfeed", method=RequestMethod.GET)
	public String deleteNewsfeed(@RequestParam int newsfeedID, Model model) throws Exception{
		System.out.println("deleteNewsfeed()");
		newsfeedService.deleteNewsfeed(newsfeedID);
		return "";
	}
	
	@RequestMapping(value="updateNewsfeed", method=RequestMethod.GET)
	public String updateNewsfeed(@ModelAttribute("newsfeed") Newsfeed newsfeed, Model model) throws Exception{
		System.out.println("updateNewsfeed()");
		newsfeedService.updateNewsfeed(newsfeed);
		return "forward:/newsfeed/getNewsfeed.jsp";
	}
	
	@RequestMapping(value="ufo", method=RequestMethod.GET)
	public String ufo(Model model) throws Exception{
		System.out.println("updateNewsfeed()");

		return "forward:/newsfeed/ufo.jsp";
	}
	
	@RequestMapping(value="getNewsfeed")
	public String getNewsfeed(@RequestParam int newsfeedId, Model model, HttpSession session, @ModelAttribute("search") Search search) throws Exception{
		System.out.println("getNewsfeed()");
		System.out.println(newsfeedId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("newsfeed search :: "+search);
		Newsfeed newsfeed = newsfeedService.getNewsfeed(newsfeedId);
		model.addAttribute("newsfeed", newsfeed);
		model.addAttribute("roomUser", userService.getUser(newsfeed.getUserId()));
	
		
		model.addAttribute("list", (List)(commonService.listComment(search, "N01", newsfeedId).get("list")));
		
		System.out.println("list :: "+(List)(commonService.listComment(search, newsfeed.getCategoryCode(), newsfeedId).get("list")));
		
		return "forward:/newsfeed/getNewsfeed.jsp";
		
	}
	@RequestMapping(value="listNewsfeed")
	public String listNewsfeed( @ModelAttribute("search") Search search,  Model model, HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("listNewsfeed");
		System.out.println(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getSearchCondition() == null) {
			search.setSearchCondition("N06");
		}
		if(search.getCategory() == null && session.getAttribute("user") != null) {
			System.out.println("getcategory == null");
			search.setCategory(String.valueOf(((User)session.getAttribute("user")).getUserId()));
		}
		if(search.getSearchKeyword() == null) {
			search.setPageSize(15);
			Map<String, Object> map = newsfeedService.listNewsfeed(search);
			//List<Newsfeed> list = newsfeedService.listNewsfeeds(search);
			//User user = userService.getUser(userId);
			// Business logic ¼öÇà
			System.out.println("list :: "+(List)map.get("list"));
			System.out.println("list :: "+((List)map.get("list")).size());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			//System.out.println(resultPage);
			
			// Model °ú View ¿¬°á
			//model.addAttribute("list", map.get("list"));
			//model.addAttribute("resultPage", resultPage);
			//System.out.println(list);
			model.addAttribute("search", search);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
		}
		else if(search.getSearchKeyword() != null) {
			System.out.println("searchkeyword != null");
			List<Newsfeed> list = newsfeedService.friendNewsfeed(Integer.parseInt(search.getSearchKeyword()));
			model.addAttribute("list", list);
			model.addAttribute("search", search);
		}
		
		
		return "forward:/newsfeed/newsfeed.jsp";
	}
	
	
	
	

}

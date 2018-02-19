package com.zaching.web.friend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.User;
import com.zaching.service.domain.Voice;
import com.zaching.service.friend.FriendService;
import com.zaching.service.user.UserService;


@Controller
@RequestMapping("/friend/*")
public class FriendRestController {
	
	@Autowired
	@Qualifier("friendServiceImpl")

	private FriendService friendService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public FriendRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "rest/listFriend", method=RequestMethod.POST)
	public List<Friend> listFriend(@ModelAttribute("search") Search search,HttpSession session, Model model) throws Exception {

		
		System.out.println("friend/rest/listFriend : GET");


		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchKeyword(String.valueOf(((User)session.getAttribute("user")).getUserId()));

		Map<String, Object> map = friendService.listFriend(search);
		System.out.println(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		

		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		System.out.println((List)map.get("list"));
		
		return (List)map.get("list");
	}

}

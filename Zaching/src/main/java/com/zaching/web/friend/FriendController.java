package com.zaching.web.friend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.User;
import com.zaching.service.friend.FriendService;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {

	@Autowired
	@Qualifier("friendServiceImpl")

	private FriendService friendService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public FriendController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "addFriend", method = RequestMethod.POST)
	public String addFriend(@ModelAttribute("friend") Friend friend, Model model) throws Exception {
		System.out.println("/friend/addFriend:POST");

		System.out.println("friendController addFriend끝==============");
		
		return "forward:/friend/addFriend.jsp";
		
	}

	@RequestMapping(value = "listFriend",method=RequestMethod.GET)
	public String listFriend(@ModelAttribute("search") Search search,HttpSession session, Model model ,HttpServletRequest request) throws Exception {

		
		System.out.println("friend/listFriend : GET");
		
		int userId = ((User)session.getAttribute("user")).getUserId();

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchKeyword(String.valueOf(((User)session.getAttribute("user")).getUserId()));

		Map<String, Object> map = friendService.listFriend(search);
		System.out.println(search);
		Friend f;
		String[] str;
		List list = (List)map.get("list");
		for(int i = 0; i<list.size(); i++) {
			f = (Friend)list.get(i);
			str = f.getCreatedDate().split("-");
			f.setCreatedDate(str[0]+"년 "+str[1]+"월");
			list.set(i, f);
		}
		System.out.println("이");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		List<Friend> list2 = friendService.recommendFriend(userId);

		model.addAttribute("list", list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("recommendList", list2);
		request.setAttribute("countFriend",friendService.countFriend(userId));
		System.out.println(list2);
		System.out.println("ddddddddddd"+friendService.countFriend(userId));
		System.out.println("listFriend 끝============");
		
		return "forward:/friend/listFriend.jsp";
	}
	
	
	
	@RequestMapping(value="getFriend",method=RequestMethod.POST)
	public String getFriend(@RequestParam(value="id",required=false)int id, Model model, HttpSession session) throws Exception{
		
		System.out.println("friend/getFriend:POST");
		
		
		
		Friend friend=friendService.getFriend(id);
		
		model.addAttribute("friend",friend);
		
		return "forward:/friend/getFriend.jsp";
		
	}
	
	@RequestMapping(value="updateFriend",method=RequestMethod.GET)
	public String updateFriend(@RequestParam(value="id",required=false)int id,Model model)throws Exception{
		System.out.println("/friend/updateFriend:GET");
		
		Friend friend=friendService.getFriend(id);
		model.addAttribute("friend",friend);
		
		return "forward:/friend/updateFriend.jsp";
		
		
	}

}

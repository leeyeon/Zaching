
package com.zaching.web.friend;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.Payment;
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
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;

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
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		

		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
				

		
		return (List)map.get("list");
	}
	
	@RequestMapping(value = "rest/addFriend", method=RequestMethod.POST)
	public String addtFriend(@ModelAttribute("notice") Notice notice, @RequestBody Map<String, Object> map, @ModelAttribute("friend") Friend friend, @ModelAttribute("search") Search search,HttpSession session, Model model) throws Exception {
	
		int userId2 = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String userName =  ((String)map.get("userName"));
		
		friend.setFriendId(friendId);
		friend.setUserId(userId2);
		System.out.println(friend);
		
		friendService.addFriend(friend, "0");
		
		if(map.get("check") == null) {
			System.out.println("check :: "+map.get("check"));
			notice.setSenderId(userId2);
			notice.setCategory("F00");
			notice.setName(userName);
			commonService.addNotice(notice);
	
			notice.setUserId(friendId);
	
			commonService.addNoticeTarget(notice);
		}
		
		else {
			System.out.println("왜안드가ㅏㅏㅏㅏ");
		}
		
		/*알림*/
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		search.setSearchKeyword(String.valueOf(notice.getSenderId()));
		Map<String, Object> hashMap = friendService.listFriend(search);
		List<String> list = null;
		for(int i=0; i< ((List)map.get("list")).size();i++) {
			list.add(String.valueOf(((Friend)((List)hashMap.get("list")).get(i)).getFriendId()));
		}
		List<String> tokenList = new ArrayList<String>();
	        
	        for (String userId : list) {
	           String token = userService.getFCMToken(Integer.valueOf(userId));
	           if(token != null) {
	              tokenList.add(token);
	           }
	        }
	        
	        for (String string : tokenList) {
	           System.out.println(string);
	        }
	        
	        notice = new Notice();
	        notice.setCategory("F00:");
	        notice.setContent(userName+"님으로부터 친구 신청이 왔습니다.");
	        
	        // 안드로이드 알람 보내기
	        if(tokenList.size() > 0) {
	           commonService.sendAndroid(tokenList, notice);
	        }
		

		return null;
	}
	
	@RequestMapping(value = "rest/cancelFriend", method=RequestMethod.POST)
	public String cancelFriend(@ModelAttribute("notice") Notice notice, @RequestBody Map<String, Object> map, @ModelAttribute("friend") Friend friend, @ModelAttribute("search") Search search,HttpSession session, Model model) throws Exception{
		System.out.println("restCancelFriend()");
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String userName =  ((String)map.get("userName"));
		
		friend.setFriendId(friendId);
		friend.setUserId(userId);
		System.out.println(friend);
		
		friendService.cancelFriend(userId, friendId, 0);
		
		/*알림
		 * 알림 삭제 넣어야됨
		 */
		return null;
	}
	
	@RequestMapping(value = "rest/delectFriend", method=RequestMethod.POST)
	public String delectFriend(@ModelAttribute("notice") Notice notice, @RequestBody Map<String, Object> map, @ModelAttribute("friend") Friend friend, @ModelAttribute("search") Search search,HttpSession session, Model model) throws Exception{
		System.out.println("delectFriend()");
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String userName =  ((String)map.get("userName"));
		
		friend.setFriendId(friendId);
		friend.setUserId(userId);
		System.out.println(friend);
		
		friendService.cancelFriend(userId, friendId, 0);
		

		return null;
	}
	
	@RequestMapping(value="rest/cutFriend", method=RequestMethod.POST)
	public String cutFriend(@RequestBody Map<String, Object> map, Model model) throws Exception{
		System.out.println("cutFriend()");
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		
		friendService.cancelFriend(userId, friendId, 0);
		friendService.updateStatus(friendId, userId, 1);
	
		
		return null;
	}
	
	@RequestMapping(value="rest/refuseFriend", method=RequestMethod.POST)
	public String refuseFriend(@RequestBody Map<String, Object> map, Model model) throws Exception{
		System.out.println("refuseFriend()");
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		int noticeId = ((int)map.get("noticeId"));
		
		friendService.updateStatus(friendId, userId, 1);		

		commonService.deleteNotice(noticeId);
	
		
		return null;
	}
	
	@RequestMapping(value="rest/okFriend", method=RequestMethod.POST)
	public String okFriend(@RequestBody Map<String, Object> map, Model model) throws Exception{
		System.out.println("okFriend()");
		int noticeId = ((int)map.get("noticeId"));

		commonService.deleteNotice(noticeId);
	
		
		return null;
	}
	

	
	
	@RequestMapping(value="rest/addFollow", method=RequestMethod.POST)
	public String addFollow(@RequestBody Map<String, Object> map, @ModelAttribute("friend") Friend friend, Model model) throws Exception{
		System.out.println("cutFriend()");
		System.out.println("addfollowFriend :: "+friend);
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String userName =  ((String)map.get("userName"));
		
		friend.setFriendId(friendId);
		friend.setUserId(userId);
		System.out.println(friend);
		
		friendService.addFriend(friend, "1");
		
		
		return null;
	}
	
	@RequestMapping(value="rest/cancelFollow", method=RequestMethod.POST)
	public String cancelFollow(@RequestBody Map<String, Object> map, @ModelAttribute("friend") Friend friend, Model model) throws Exception{
		System.out.println("restCancelFollow");
		
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String userName =  ((String)map.get("userName"));
		
		friend.setFriendId(friendId);
		friend.setUserId(userId);
		System.out.println(friend);
		
		friendService.cancelFriend(userId, friendId, 1);
		
		return null;
	}

}

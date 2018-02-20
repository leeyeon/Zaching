package com.zaching.web.notice;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.LivingInfo;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.User;
import com.zaching.service.friend.FriendService;
import com.zaching.service.domain.Notice;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("friendServiceImpl")

	private FriendService friendService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	public NoticeController() {
		System.out.println("/notice");
	}
	
	
	@RequestMapping(value = "listNotice", method = RequestMethod.GET)
	public String listNotice(@RequestParam int userId, Model model, @ModelAttribute("notice") Notice notice,HttpSession session, @ModelAttribute("search") Search search) throws Exception {
		
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}		
		
		search.setPageSize(pageSize);

		Map<String, Object> map =  commonService.listNotice(search, userId);		

		Page resultPage	= new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(map);
		System.out.println(resultPage);
		
		model.addAttribute("list",map.get("list"));
		
		return "forward:/user/listNotice.jsp";
	}
	
	
	@RequestMapping(value = "makeNotice", method = RequestMethod.GET)
	public String makeNotice(Model model, @ModelAttribute("notice") Notice notice,HttpSession session, @ModelAttribute("search") Search search) throws Exception {
		
		//각자 notice setting
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		notice.setSenderId(9);
		notice.setCategory("B00");
		notice.setName("이연희");
		notice.setBobId(3);
		commonService.addNotice(notice);
		//search 키워드(userId)로 친구 목록 가지고 오기
		//search.setSearchKeyword(String.valueOf(((User)session.getAttribute("user")).getUserId()));
		search.setSearchKeyword(String.valueOf(notice.getSenderId()));
		Map<String, Object> map = friendService.listFriend(search);
		
		for(int i=0; i< ((List)map.get("list")).size();i++) {
			Friend friend = (Friend)((List)map.get("list")).get(i);
			notice.setUserId(friend.getFriendId());

			commonService.addNoticeTarget(notice);

		}
		//여기까지
		

		
		return "forward:/admin/test2.jsp";
	}
	

	
}

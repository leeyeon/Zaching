package com.zaching.web.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Message;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.User;
import com.zaching.service.message.MessageService;

@RestController
@RequestMapping("/message/*")
public class MessageRestController {
	


	@Autowired
	@Qualifier("messageServiceImpl")
	
private MessageService messageService;
	
	public MessageRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	
	@RequestMapping(value="json/listMessage", method=RequestMethod.POST)
	public List<String> listMessage(@RequestBody Search search,HttpSession session)  throws Exception{
		System.out.println("json/listMessage/listMessage()");
		
	      if(search.getCurrentPage() ==0 ){
	          search.setCurrentPage(1);
	          }
	
	      search.setPageSize(pageSize);
	      search.setSearchCondition("roomId");
	      
	      System.out.println(search);
			
		//System.out.println(((User)session.getAttribute("user")).getUserId()+"");
			
	      Map<String, Object> map = messageService.listMessage(search);
	  	Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("resultPage::"+resultPage);
		System.out.println("list::"+map.get("list"));
		  System.out.println("listSize :: "+((List)map.get("list")).size());
	      
	      return (List)map.get("list");
		
	}
	
	@RequestMapping(value = "json/addMessage", method=RequestMethod.POST)
	public String addMessage(@ModelAttribute("message") Message message,@RequestBody Map<String,Object>map,@ModelAttribute("search") Search search,Model model)throws Exception{
		int userId = ((int)map.get("userId"));
		int friendId = ((int)map.get("friendId"));
		String content =  ((String)map.get("content"));
		
		message.setFriendId(friendId);
		message.setUserId(userId);
		System.out.println(message);
		
		messageService.addMessage(message);
		
		
		
		return null;
	}
		

		
		

}


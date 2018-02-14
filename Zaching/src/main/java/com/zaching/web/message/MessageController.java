package com.zaching.web.message;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;
import com.zaching.service.domain.User;
import com.zaching.service.message.MessageService;

@Controller
@RequestMapping("/message/*")

public class MessageController {
	@Autowired
	@Qualifier("messageServiceImpl")

	private MessageService messageService;
	
	public MessageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addMessage",method=RequestMethod.POST)
	public String addMessage(@ModelAttribute("message")Message message,Model model)throws Exception{
		System.out.println("/message/addMessage:POST");
		
		return "forward:/message/addMessage.jsp";
		
	}
	
	@RequestMapping(value="listMessage")
	public String listMessage(@ModelAttribute("search")Search search, 
							HttpSession session, 
							Model model)throws Exception{
		
		System.out.println("message/listMessage:GET");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		search.setSearchKeyword(((User)session.getAttribute("user")).getUserId()+"");
		
		Map<String , Object> map=messageService.listMessage(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		
		model.addAllAttributes(map);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/message/listMessage.jsp";
		
	}
		
		
		@RequestMapping(value="getMessage")
		public String getMessage(@RequestParam(value="messageId",required=false)int messageId,Model model)throws Exception{
			System.out.println("message/getMessage:POST");
			
			Message message=messageService.getMessage(messageId);
			
			model.addAttribute("message",message);
			
			return "forward:/message/getMessage.jsp";
			
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

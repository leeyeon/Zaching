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
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Message;
import com.zaching.service.domain.User;
import com.zaching.service.message.MessageService;

@Controller
@RequestMapping("/message/*")

public class MessageController {
	@Autowired
	@Qualifier("messageServiceImpl")

	private MessageService messageService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public MessageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="listMessage")
	public String listMessage(@ModelAttribute("search")Search search, 
							HttpSession session, 
							Model model)throws Exception{
		
		System.out.println("message/listMessage:GET/POST");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		search.setSearchKeyword(((User)session.getAttribute("user")).getUserId()+"");
		
		System.out.println("¼­Ä¡"+search);
		Map<String , Object> map=messageService.listMessage(search);
		
		Page resultPage = new Page( search.getCurrentPage(),(Integer)map.get("totalCount"), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("¸Ê"+map);
		
		model.addAllAttributes(map);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/message/listMessage.jsp";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

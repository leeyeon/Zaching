package com.zaching.web.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
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
			
			search.setSearchKeyword(((User)session.getAttribute("user")).getUserId()+"");
	      
	      Map<String, Object> map = messageService.listMessage(search);
	  	Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("resultPage::"+resultPage);
		System.out.println("list::"+map.get("list"));
		  System.out.println("listSize :: "+((List)map.get("list")).size());
	      
	      return (List)map.get("list");
		
	}


}


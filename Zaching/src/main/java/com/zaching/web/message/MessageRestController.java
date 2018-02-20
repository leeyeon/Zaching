package com.zaching.web.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;
import com.zaching.service.message.MessageService;

@RestController
@RequestMapping("/message/*")
public class MessageRestController {

	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;

	public MessageRestController(MessageService messageService) {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "/json/listMessage", method = RequestMethod.POST)
	public List<Message> listMessage(@RequestBody Search search) throws Exception {
		System.out.println("json/listMessage/listMessage()");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		//System.out.println("search :: " + search);

		Map<String, Object> map = messageService.listMessage(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), 9,
				search.getPageSize());
		System.out.println("resultPage :: " + resultPage);
		System.out.println("list :: " + map.get("list"));
		System.out.println("listSize :: " + ((List) map.get("list")).size());

		return (List) map.get("list");

	}

	@RequestMapping(value = "/json/addMessage", method = RequestMethod.POST)
	public Message addMessage(@RequestBody Message message) throws Exception {
		System.out.println("message/json/addMessage");

		return null;
	}

}

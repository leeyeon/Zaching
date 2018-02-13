package com.zaching.web.broadcast;

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
import com.zaching.common.service.CommonService;
import com.zaching.service.broadcast.BroadcastDao;
import com.zaching.service.broadcast.BroadcastService;
import com.zaching.service.domain.Voice;

@RestController
@RequestMapping("/broadcast/*")
public class BroadcastRestController {
	
	@Autowired
	@Qualifier("broadcastServiceImpl")
	private BroadcastService broadcastService;
		
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	
	public BroadcastRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="json/listBroadcast", method=RequestMethod.POST)
	public List<String> listBroadcast(@RequestBody Search search) throws Exception{
		System.out.println("json/listBroadcast/listBroadcast()");
		
		if(search.getCurrentPage() ==0 ){
		search.setCurrentPage(1);
		}
		//System.out.println("search :: "+search);
		
		Map<String, Object> map = broadcastService.listBroadcast(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 9, search.getPageSize());
		System.out.println("resultPage :: "+resultPage);
		System.out.println("list :: "+ map.get("list"));
		System.out.println("listSize :: "+((List)map.get("list")).size());
		
		return (List)map.get("list");
	}

}


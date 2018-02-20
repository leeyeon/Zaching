package com.zaching.web.broadcast;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.broadcast.BroadcastService;
import com.zaching.service.domain.Broadcast;
import com.zaching.service.domain.User;

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

	@RequestMapping("json/addBroadcast")
	public JSONObject addBroadcast(MultipartHttpServletRequest request, HttpSession session) throws Exception {

		User sessionUser = (User)session.getAttribute("user");
		
		Broadcast broadcast = new Broadcast();
		broadcast.setTitle(request.getParameter("title"));
		broadcast.setDetail("detail");
		broadcast.setForbidden(request.getParameter("forbidden"));
		broadcast.setUserId(sessionUser.getUserId());
		broadcast.setUserName(sessionUser.getName());
		broadcast.setProfileImage(sessionUser.getProfileImage());
		
		System.out.println("broadcast!!! :: "+broadcast);
		
		boolean isSuccess = false;
		try {
			MultipartFile file = request.getFile("image");
			String fileName = commonService.addFileImage(request, file);
			broadcast.setFileName(fileName);
			broadcastService.addBroadcast(broadcast);
			isSuccess = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONObject result = new JSONObject();
		if(isSuccess) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}


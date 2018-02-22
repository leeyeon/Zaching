package com.zaching.web.notice;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.zaching.common.URLConnection;
import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.Report;
import com.zaching.service.domain.User;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.user.UserService;

import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.cxf.io.CachedOutputStreamCallback;
import org.apache.cxf.message.Message;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@RestController
@RequestMapping("/notice/*")
public class NoticeRestController {
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;	

	public NoticeRestController() {
		System.out.println("/notice/rest/");
		


	}
	
	@RequestMapping(value = "rest/noticeList", method = RequestMethod.POST)
	public String noticeList(@RequestBody Map<String, Object> map, @ModelAttribute("notice") Notice notice, @ModelAttribute("search") Search search) throws Exception {

		String userId = ((String)map.get("RECEIVER_ID"));
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		
		search.setPageSize(pageSize);

		Map<String, Object> mapp =  commonService.listNotice(search, Integer.parseInt(userId));
		

		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)mapp.get("totalCount")).intValue(), 
				pageUnit, pageSize);
	
		Gson gson = new Gson(); 
		String json = gson.toJson(mapp); 
		
		System.out.println(json);
	
		
		return json;
		
		
	}
	
	@RequestMapping(value = "rest/noticeUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String noticeUpdate(@RequestBody Map<String, Object> map) throws Exception {

		String noticeId = ((String)map.get("noticeId"));
		System.out.println(noticeId);
		commonService.noticeUpdate(Integer.parseInt(noticeId));

		
		return "success";
	}
	
	@RequestMapping(value = "rest/noticeSend", method = RequestMethod.POST)
	public String noticeSend(@RequestBody Map<String, Object> map, @ModelAttribute("notice") Notice notice) throws Exception {
		String noticeId = ((String)map.get("userId"));

		if(Integer.parseInt(noticeId) == 31) {
			return "yes";
		}
		else {
			
			return "no";
		}
				
	}


}

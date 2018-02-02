package com.zaching.web.voice;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;
import com.zaching.service.voice.VoiceService;


@RestController
@RequestMapping("/voice/*")
public class VoiceRestController {
	@Autowired
	@Qualifier("voiceServiceImpl")
	private VoiceService voiceService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public VoiceRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/replyVoice", method=RequestMethod.GET)
	public Comment replyVoice(@RequestBody Comment comment) throws Exception {
		System.out.println("voice/json/replyComment");
		
		return null;
	}
	
	@RequestMapping(value="rest/searchVoice", method=RequestMethod.POST)
	public String searchVoice(@RequestBody Map<String, Object> map , HttpSession session) throws Exception {
		System.out.println("voice/json/searchVoice");
		
		String addr = "http://apis.skplanetx.com/melon/songs"+"?appKey=";
		String serviceKey = "f28a60d4-8447-3157-b8af-12487d8b8a1a";
		String parameter = "";
		
		String searchKeyword = URLEncoder.encode(((String)map.get("keyword")), "UTF-8");
		
		
		parameter = parameter + "&" +"count=100";
		parameter = parameter + "&" +"page=1";
		parameter = parameter + "&" +"version=1";
		parameter = parameter + "&" + "searchKeyword="+ searchKeyword;
		parameter = parameter + "&" +"format=json";
		
		
		addr = addr + serviceKey + parameter;
			URL url = new URL(addr);
		
		InputStream is = null;
		InputStreamReader isr = null; 
		
		is = new URL(addr).openStream();
		isr = new InputStreamReader(is, "utf-8");
		
		StringBuffer sb = new StringBuffer();
		int c;
	
		while ((c = isr.read()) != -1) {
			sb.append((char) c);
		}

	
		return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();
	}

}

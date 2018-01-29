package com.zaching.web.voice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

}

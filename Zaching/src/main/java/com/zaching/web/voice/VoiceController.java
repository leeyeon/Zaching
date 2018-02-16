package com.zaching.web.voice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcraft.jsch.ChannelSftp;
import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceService;

@Controller
@RequestMapping("/voice/*")
public class VoiceController {
	private ChannelSftp channelSftp = null;
	@Autowired
	@Qualifier("voiceServiceImpl")
	private VoiceService voiceService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public VoiceController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addVoice", method=RequestMethod.POST)
	public String addVoice(@ModelAttribute("voice") Voice voice, Model model) throws Exception{
		System.out.println("addVoice()");
		voiceService.addVoice(voice);
		model.addAttribute(voice);
		
		return "forward:/voice/getVoice.jsp";
	}
	
	@RequestMapping(value="deleteVoice", method=RequestMethod.GET)
	public String deleteVoice(@RequestParam("voiceId") int voiceId) throws Exception{
		System.out.println("deleteVoice()");
		voiceService.deleteVoice(voiceId);
		
		return "forward:/voice/listVoice.jsp";
	}
	
	@RequestMapping(value="listVoice", method=RequestMethod.GET)
	public String listVoice(@ModelAttribute("search") Search search, @RequestParam("categoryCode") String categoryCode, Model model) throws Exception{
		System.out.println("listNewsfeed");
		String sorting = null;
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = voiceService.listVoice(search);
		// Business logic 수행
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);

		model.addAttribute("search", search);
		
		return "forward:/voice/listVoice.jsp";
	}
	
	@RequestMapping(value="testUpload")
	public String testUpload(@RequestParam String link, @RequestParam String fileName) throws Exception{
		System.out.println(link);
		System.out.println(fileName);
		
		boolean result = false;
		
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		
		inputStream = new FileInputStream(link);
		outputStream = new FileOutputStream("C:\\Users\\jiwon\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\audio");
		
		FileChannel fcin = inputStream.getChannel();
		FileChannel fcout = outputStream.getChannel();
		
		long size = 0;
		
		size = fcin.size();
		fcin.transferTo(0, size, fcout);
		
		fcout.close();
		fcin.close();
		outputStream.close();
		inputStream.close();
		result = true;
		
		File file = new File(link);
		if(file.delete()) {
			result = true;
		}
		
		return "newsfeed/listNewsfeed";
	}

}

package com.zaching.web.voice;

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

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceService;

@Controller
@RequestMapping("/voice/*")
public class VoiceController {
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
	
	@RequestMapping(value="listVoice")
	public String listVoice(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("listVoice");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getCategory() == null) {
			search.setCategory("R01");
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = voiceService.listVoice(search);
		// Business logic 수행
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println("list :: "+map.get("list"));
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);

		model.addAttribute("search", search);
		
		return "forward:/voice/listVoice.jsp";
	}

}

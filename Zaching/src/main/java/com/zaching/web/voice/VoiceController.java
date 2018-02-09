package com.zaching.web.voice;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.imageio.ImageIO;

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
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceService;

@Controller
@RequestMapping("/voice/*")
public class VoiceController {
	@Autowired
	@Qualifier("voiceServiceImpl")
	private VoiceService voiceService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	private String fileDirectory = "C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";
	
	public VoiceController() {
		System.out.println(this.getClass());
	}
	
	//@RequestMapping(value="getVoice", method=RequestMethod.GET)
	//public String getVoice(@RequestParam int voiceId)
	
	@RequestMapping(value="addVoice", method=RequestMethod.POST)
	public String addVoice(@ModelAttribute("voice") Voice voice, Model model) throws Exception{
		System.out.println("addVoice()");
		System.out.println(voice);
		String path = "";
		//voiceService.addVoice(voice);
		if(voice.getUploadFile() != null) {
			try {
				path = commonService.addFile(fileDirectory, voice.getUploadFile());
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("path :: "+path);
		if(path != null) {
			voice.setBackgroundImage(path.substring(path.indexOf("\\")+1));
			File in = new File(fileDirectory+path);
	        BufferedImage inputImage = ImageIO.read(in);
	 
	        int width = 440;
	        int height = 330;
	        // set resize
	 
	            BufferedImage outputImage = new BufferedImage(width, height,
	                BufferedImage.TYPE_INT_RGB);
	            Graphics2D g = outputImage.createGraphics();
	            g.drawImage(inputImage, 0, 0, width, height, null);
	            System.out.println(voice.getBackgroundImage());
	            File out = new File("C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\images\\voiceImages\\"+voice.getBackgroundImage());
	            FileOutputStream fos = new FileOutputStream(out);
	            System.out.println("ssss"+voice.getBackgroundImage().substring(voice.getBackgroundImage().indexOf(".")+1));
	            ImageIO.write(outputImage, voice.getBackgroundImage().substring(voice.getBackgroundImage().indexOf(".")+1), fos);
		}
		voiceService.addVoice(voice);
		System.out.println("id::"+voice.getVoiceId());
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

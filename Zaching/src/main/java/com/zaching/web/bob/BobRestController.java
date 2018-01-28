package com.zaching.web.bob;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.service.CommonService;

@RestController("/bob/rest/*")
public class BobRestController {
	
	private String fileDirectory = "C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";

	@Autowired
	@Qualifier("commonServiceImpl")
	CommonService commonService;
	
	public BobRestController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/addSummernoteImage")
	public JSONObject addSummernoteImage(@RequestParam MultipartFile uploadFile) {
		
		System.out.println("addImage...1");
		
		String fileName = commonService.addFile(fileDirectory, uploadFile);
		
		System.out.println("addImage...2");
		
		JSONObject obj = new JSONObject();
		obj.put("url", fileDirectory+fileName);
		
		return obj;
	}
}

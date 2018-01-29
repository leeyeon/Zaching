package com.zaching.web.bob;

import java.io.IOException;
import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;

@RestController("/bob/rest/*")
public class BobRestController {
	
	private String fileDirectory = "C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\images\\";

	@Autowired
	@Qualifier("commonServiceImpl")
	CommonService commonService;
	
	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	//@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize = 9;
	
	public BobRestController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/addSummernoteImage")
	public JSONObject addSummernoteImage(MultipartHttpServletRequest req) throws Exception{
		
		//MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		
		MultipartFile file = req.getFile("uploadFile");
		//System.out.println("addImage...1"+req.getFileMap());
		System.out.println(req+","+file.getOriginalFilename());
		//System.out.println(file.getOriginalFilename());
		String fileName = commonService.addFile(fileDirectory, file);
		
		//File serverFile = new File(fileDirectory+ file.getOriginalFilename());
		//file.transferTo(serverFile);
		
		System.out.println("addImage...2");
		
		JSONObject obj = new JSONObject();
		obj.put("url", fileDirectory+fileName);
		
		return obj;
	}
	
	@RequestMapping(value="/listBob", method=RequestMethod.POST)
	public JSONObject listBob(@ModelAttribute Search search) throws Exception {
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		System.out.println(search);
		
		Map<String, Object> map = bobService.listBob(search);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 
				pageUnit, pageSize);
		
		List<Bob> list = (List<Bob>)map.get("list");
		
		JSONObject obj = new JSONObject();
		obj.put("list", list);
		obj.put("resultPage", resultPage);
		
		for (Bob bob : list) {
			System.out.println(list);
		}
		
		return obj;
	}
}

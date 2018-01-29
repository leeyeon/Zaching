package com.zaching.web.bob;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Payment;
import com.zaching.service.payment.PaymentService;

@RestController("/bob/rest/*")
public class BobRestController {
	
	private String fileDirectory = "C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";

	@Autowired
	@Qualifier("commonServiceImpl")
	CommonService commonService;
	
	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	//@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize = 9;
	
	private Logger logger;
	
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
	
	@RequestMapping(value="/enterBob", method=RequestMethod.POST)
	public JSONObject enterBob(@RequestBody Map<String, Object> obj) throws Exception {
		
		System.out.println("µ·³ª°©´Ï´Ù?");
		String category = (String)obj.get("category");
		int userId = (int)obj.get("userId");
		int bobId = (int)obj.get("bobId");
		
		System.out.println(category+"//"+userId+"//"+bobId);
		
		if(category.equals("B01")) {
			int userPoint = paymentService.getPoint((int)obj.get("userId"));
			
			/* ¾à¼Óºñ 1000¿ø Â÷°¨ */
			if(userPoint > 1000) {
				System.out.println("µ· ÁøÂ¥ ³ª°©´Ï´Ù 2");
				Payment payment = new Payment();
				payment.setUserId(userId);
				payment.setPoint(1000);
				payment.setPaymentCode("P02");
				paymentService.managePoint(payment);
			} else {
				
			}
		}
		
		bobService.enterBob(userId, bobId);
	
		return null;
	}
}

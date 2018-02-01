package com.zaching.web.bob;


import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Comment;
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
		obj.put("url", "..\\resources\\upload_files\\images\\"+fileName);
		
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
	@ResponseBody
	public JSONObject enterBob(@RequestBody Map<String, Object> obj) throws Exception {
		
		System.out.println("돈나갑니다?");
		String category = (String)obj.get("category");
		int userId = (int)obj.get("userId");
		int bobId = (int)obj.get("bobId");
		
		System.out.println(category+"//"+userId+"//"+bobId);
		
		if(category.equals("B01")) {
			int userPoint = paymentService.getPoint((int)obj.get("userId"));
			
			if(userPoint > 1000) {
				/* 약속비 1000원 차감 */
				System.out.println("돈 진짜 나갑니다 2");
				Payment payment = new Payment();
				payment.setUserId(userId);
				payment.setPoint(1000);
				payment.setPaymentCode("P02");
				paymentService.managePoint(payment);
				
				/* 마일리지 적립 */
				payment.setPoint(500);
				payment.setPaymentCode("M01");
				paymentService.managePoint(payment);
			}
		}
		
		// 참가중이 아닐때 참가됨
		boolean result = bobService.enterBob(userId, bobId);
		
		JSONObject object = new JSONObject();

		if(result) {
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
	@RequestMapping(value="/cancleBob", method=RequestMethod.POST)
	public void cancleBob(@RequestBody Map<String, Object> obj) throws Exception {
		
		System.out.println("돈나갑니다?");
		String category = (String)obj.get("category");
		int userId = (int)obj.get("userId");
		int bobId = (int)obj.get("bobId");
		
		System.out.println(category+"//"+userId+"//"+bobId);
		
		if(category.equals("B01")) {
			Payment payment = new Payment();
			payment.setUserId(userId);
			payment.setPoint(1000);
			payment.setPaymentCode("P06");
			paymentService.managePoint(payment);
			
			/* 마일리지 적립취소 */
			payment.setPoint(500);
			payment.setPaymentCode("M03");
			paymentService.managePoint(payment);
		}
		
		// 참가중이 아닐때 참가됨
		bobService.enterBob(userId, bobId);
	}

	@RequestMapping(value="/setFeebob", method=RequestMethod.POST)
	public JSONObject setFeebob(@RequestBody Map<String, Object> obj) throws Exception {
	
		//System.out.println(obj.get("participantId"));
		//System.out.println(obj.get("isAutoFee"));
		boolean isAutoFee = true;
		
		if(obj.get("isAutoFee").equals("Y")) {
			isAutoFee = false;
		}
		
		//System.out.println("요기11");
		
		bobService.setFeeBob(Integer.valueOf(obj.get("participantId").toString()), isAutoFee);
		
		JSONObject object = new JSONObject();
		
		if(isAutoFee) {
			object.put("isAutoFee", "Y");
		} else {
			object.put("isAutoFee", "N");
		}
		
		//System.out.println("요기22");
		
		return object;
	}
	
	@RequestMapping(value="/payFeebob", method=RequestMethod.POST)
	public JSONObject payFeebob(@RequestBody Map<String, Object> obj) throws Exception {
		
		System.out.println(obj.get("userId"));
		System.out.println(obj.get("participantId"));
		System.out.println(obj.get("fee"));
		
		int fee = Integer.valueOf(obj.get("paidFee").toString());
		int userPoint = paymentService.getPoint(Integer.valueOf(obj.get("userId").toString()));
		
		JSONObject object = new JSONObject();
		
		if(userPoint >= fee) {
			
			bobService.payFeeBob(Integer.valueOf(obj.get("participantId").toString()), fee);
			
			Payment payment = new Payment();
			payment.setPaymentCode("P02");
			payment.setUserId(Integer.valueOf(obj.get("userId").toString()));
			payment.setPoint(fee);
			
			paymentService.managePoint(payment);
			
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
}

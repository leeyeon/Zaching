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
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.Payment;
import com.zaching.service.newsfeed.NewsfeedService;
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
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

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
	public JSONObject listBob(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println(this.getClass()+"/lisbBob");
		System.out.println((String)map.get("category"));
		System.out.println((String)map.get("searchKeyword"));
		
		Search search = new Search();
		search.setCategory((String)map.get("category"));
		
		if(((Integer)map.get("currentPage")).intValue() ==0 ){
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(((Integer)map.get("currentPage")).intValue());
		}
		
		search.setPageSize(pageSize);
		
		System.out.println(search);
		
		Map<String, Object> map1 = bobService.listBob(search);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map1.get("totalCount")).intValue(), 
				pageUnit, pageSize);
		
		List<Bob> list = (List<Bob>)map1.get("list");
		
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
		
		System.out.println(this.getClass()+"/enterBob");

		String category = (String)obj.get("category");
		int userId = (int)obj.get("userId");
		int bobId = (int)obj.get("bobId");
		
		System.out.println(category+"//"+userId+"//"+bobId);
		
		boolean result = true;
		
		if(category.equals("B01")) {
			int userPoint = paymentService.getPoint((int)obj.get("userId"));

			System.out.println("UserPoint ? :: "+userPoint);
			
			if(userPoint >= 1000) {
				Bob bob = bobService.getBobInfo(bobId, category);
				/* 약속비 1000원 차감 */
				System.out.println("userPoint >= 1000 이상으로 약속비 지출");
				Payment payment = new Payment();
				payment.setUserId(userId);
				payment.setPoint(1000);
				payment.setPaymentCode("P02");
				payment.setContent(category+":"+bobId+":"+bob.getTitle());
				paymentService.managePoint(payment);
				
				/* 마일리지 적립 */
				payment.setPoint(500);
				payment.setPaymentCode("M01");
				paymentService.manageMileage(payment);
				
				bobService.enterBob(userId, bobId);
				
				System.out.println("result1111");
			} else {
				System.out.println("userPoint < 1000");
				result = false;
			}
		}
		
		JSONObject object = new JSONObject();
		
		System.out.println(result);
		
		if(result) {
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
	@RequestMapping(value="/cancleBob", method=RequestMethod.POST)
	public void cancleBob(@RequestBody Map<String, Object> obj) throws Exception {
		
		String category = (String)obj.get("category");
		int userId = (int)obj.get("userId");
		int bobId = (int)obj.get("bobId");
		
		System.out.println(category+"//"+userId+"//"+bobId);
		
		if(category.equals("B01")) {
			Bob bob = bobService.getBobInfo(bobId, category);
			Payment payment = new Payment();
			payment.setUserId(userId);
			payment.setPoint(1000);
			payment.setPaymentCode("P06");
			payment.setContent(category+":"+bobId+":"+bob.getTitle());
			paymentService.managePoint(payment);
			
			/* 마일리지 적립취소 */
			payment.setPoint(500);
			payment.setPaymentCode("M03");
			paymentService.manageMileage(payment);
		}
		
		// 참가중이 아닐때 참가됨
		bobService.enterBob(userId, bobId);
	}

	@RequestMapping(value="/setFeebob", method=RequestMethod.POST)
	@ResponseBody
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
	@ResponseBody
	public JSONObject payFeebob(@RequestBody Map<String, Object> obj) throws Exception {

		int fee = Integer.valueOf(obj.get("fee").toString());
		int userPoint = paymentService.getPoint(Integer.valueOf(obj.get("userId").toString()));
		int bobId = (int)obj.get("bobId");
		
		JSONObject object = new JSONObject();
		
		System.out.println(userPoint +"::" +fee);
		
		if(userPoint >= fee) {
			Bob bob = bobService.getBobInfo(bobId, "B03");
			bobService.payFeeBob(Integer.valueOf(obj.get("participantId").toString()), fee);
			
			Payment payment = new Payment();
			payment.setPaymentCode("P02");
			payment.setUserId(Integer.valueOf(obj.get("userId").toString()));
			payment.setPoint(fee);
			payment.setContent("B03:"+bobId+":"+bob.getTitle());
			
			paymentService.managePoint(payment);
			
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
	@RequestMapping(value="/blockBob", method=RequestMethod.POST)
	@ResponseBody
	public void blockBob(@RequestBody Map<String, Object> obj) throws Exception {
		
		int bobId = Integer.valueOf(obj.get("bobId").toString());
		
		bobService.blockBob(bobId);
		
	}
	
	@RequestMapping(value="/inviteBob", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject inviteBob(@RequestBody Map<String, Object> obj) {
		
		int bobId = Integer.valueOf(obj.get("bobId").toString());
		List<Integer> listUser = (List<Integer>)obj.get("list");
		
		boolean result = false;
		
		try {
			bobService.inviteBob(listUser, bobId);
			result = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONObject object = new JSONObject();
		
		if(result) {
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
	/* 후기 */
	
	@RequestMapping(value="/addReview", method=RequestMethod.POST)
	public JSONObject addReview(@RequestBody Map<String, Object> obj) {
		
		//System.out.println("흠냐링?");
		
		System.out.println("addReview 파일 이름:"+obj.get("image"));
		
		Newsfeed newsfeed = new Newsfeed();
		newsfeed.setCategoryCode("N10:"+obj.get("bobId"));
		newsfeed.setContent((String)obj.get("content"));
		newsfeed.setStatus("0");
		newsfeed.setPrivacyBound("0");
		newsfeed.setUserId(((Integer)obj.get("userId")).intValue());
		
		String tempImage = (String)obj.get("image");
		
		if(!tempImage.equals("")) {
			tempImage = tempImage.substring(0, 6)+"/"+tempImage.substring(6);
		}
		newsfeed.setFileName(tempImage);

		System.out.println(newsfeed);
		
		boolean result = false;
		
		try {
			newsfeedService.addNewsfeed(newsfeed);
			result = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONObject object = new JSONObject();
		
		if(result) {
			object.put("response", "success");
		} else {
			object.put("response", "fail");
		}
		
		return object;
	}
	
}

package com.zaching.web.broadcast;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.broadcast.BroadcastService;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.User;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.user.UserService;

@RestController
@RequestMapping("/broadcast/*")
public class BroadcastRestController {
   
   @Autowired
   @Qualifier("broadcastServiceImpl")
   private BroadcastService broadcastService;
   
   @Autowired
   @Qualifier("userServiceImpl")
   private UserService userService ;
   
   @Autowired
   @Qualifier("paymentServiceImpl")
   private PaymentService paymentService;
   
   @Autowired
   @Qualifier("commonServiceImpl")
   private CommonService commonService;
   
   
   public BroadcastRestController() {
      System.out.println(this.getClass());
   }

   @RequestMapping(value="json/listBroadcast", method=RequestMethod.POST)
   public List<String> listBroadcast(@RequestBody Search search) throws Exception{
      System.out.println("json/listBroadcast/listBroadcast()");
      
      if(search.getCurrentPage() ==0 ){
      search.setCurrentPage(1);
      }
      //System.out.println("search :: "+search);
      
      Map<String, Object> map = broadcastService.listBroadcast(search);
      
      Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 9, search.getPageSize());
      System.out.println("resultPage :: "+resultPage);
      System.out.println("list :: "+ map.get("list"));
      System.out.println("listSize :: "+((List)map.get("list")).size());
      
      return (List)map.get("list");
   }
/*
   @RequestMapping("json/addBroadcast")
   public JSONObject addBroadcast(MultipartHttpServletRequest request, HttpSession session) throws Exception {

      User sessionUser = (User)session.getAttribute("user");
      
      Broadcast broadcast = new Broadcast();
      broadcast.setTitle(request.getParameter("title"));
      broadcast.setDetail("detail");
      broadcast.setForbidden(request.getParameter("forbidden"));
      broadcast.setUserId(sessionUser.getUserId());
      broadcast.setUserName(sessionUser.getName());
      broadcast.setProfileImage(sessionUser.getProfileImage());
      
      System.out.println("broadcast!!! :: "+broadcast);
      
      boolean isSuccess = false;
      try {
         MultipartFile file = request.getFile("image");
         String fileName = commonService.addFileImage(request, file);
         broadcast.setFileName(fileName);
         broadcastService.addBroadcast(broadcast);
         isSuccess = true;
      } catch(Exception e) {
         e.printStackTrace();
      }
      
      JSONObject result = new JSONObject();
      if(isSuccess) {
         result.put("result", "success");
      } else {
         result.put("result", "fail");
      }
      
      return result;
   }
   */
   @RequestMapping("json/getUser/{userId}")
   @ResponseBody
   public JSONObject getUser(@PathVariable int userId) throws Exception {
      
      JSONObject json = new JSONObject();
      
      //System.out.println(obj.get("userId"));
      
      //json.put("user", userService.getUser(Integer.valueOf(obj.get("userId").toString())));
      
      User user = userService.getUser(userId);
      
      json.put("userName", user.getName());
      json.put("profileImage", user.getProfileImage());
      json.put("userId", user.getUserId());
      
      System.out.println("받아 오는 get User :: "+json);
      
      return json;
   }
 
   
   @RequestMapping("json/payment")
   @ResponseBody
   public String payment(@RequestParam int userId,
		   					@RequestParam int receiverId,
		   					@RequestParam int point,
		   					@RequestParam String callback) throws Exception {
	   
	  System.out.println(this.getClass()+"/json/payment");
	
	  JSONObject json = new JSONObject();
	  json.put("point", point);
	  
	  System.out.println("parameter : "+userId +"//"+ receiverId +"//"+ point);

	  User receiver = userService.getUser(receiverId);
	  
	  System.out.println(receiver);
	  
	  boolean result = true;
	  
	  int currentPoint = paymentService.getPoint(userId);
	  
	  System.out.println("포인트 ::" +currentPoint);
	  
	  if(currentPoint >= point) {
		  Payment payment = new Payment(); 
		  payment.setUserId(userId);
		  payment.setReceiverId(receiverId);
		  payment.setPoint(point);
		  payment.setContent("P07:"+receiverId+":"+receiver.getName());
	      paymentService.presentPoint(payment);
	      System.out.println(payment);
	      
	  } else {
		  result = false;
	  }
      
     if(result) {
    	 json.put("response", "success");
     } else {
    	 json.put("response", "fail");
	 }
  
     System.out.println(json.toJSONString());
     
      return callback+"("+json+")";
   }

}

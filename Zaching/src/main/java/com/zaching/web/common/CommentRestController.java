package com.zaching.web.common;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.payment.PaymentService;

/*
 * 작성자 : 이연희
 * */

@RestController("/comment/rest/*")
public class CommentRestController {

	@Autowired
	@Qualifier("commonServiceImpl")
	CommonService commonService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize = 9;

	public CommentRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	public JSONObject addComment(@RequestBody Comment comment) throws Exception {
		
		// 필요한 정보 : userId roomId category content
		

		comment = commonService.addComment(comment);
		
		if((comment.getCategory().charAt(0))== 'N') {
			newsfeedService.updateCountReply(comment.getRoomId());
		}
		
		comment = commonService.getComment(comment.getCommentId());	
		
		JSONObject obj = new JSONObject();
		obj.put("comment", comment);
		
		return obj;
	}
	
	@RequestMapping(value="/deleteComment", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComment(@RequestBody Map<String, Object> map) throws Exception {

		commonService.deleteComment(Integer.parseInt(map.get("commentId").toString()));

		return "success";
	}
	
}

package com.zaching.web.payment;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.User;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public PaymentController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value= "kakaoLoginRequest", method=RequestMethod.GET)
	public String kakaoLogin() {
		
		System.out.println("[ kakao Login Request ]");
		
		return commonService.getAuthorizationUrl();
		
	}
	
	@RequestMapping("chargePoint")
	public String chargePoint() {
		
		return "forward:/payment/chargePoint.jsp";
	}
	
	@RequestMapping("kakaoPay")
	public String kakaoPayReady(@RequestParam("userId") int userId,
								@RequestParam("point") int point) throws Exception {
		
		//Map<String, Object> map = commonService.getAceessToken(code);
		
		String url = commonService.getPaymentReady(null, point);
		
		return "redirect:"+url;
	}
	
	@RequestMapping("kakaoPay/success")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken,
								Model model) throws Exception {
		
		int userId = 9;
		
		System.out.println("pg_token :: "+pgToken);
		
		Map<String, Object> result = commonService.getPaymentApprove(null, pgToken);
		
		Payment payment = new Payment();
		payment.setPaymentCode("P01");
		payment.setPoint((int)result.get("point"));
		payment.setUserId(userId);
		paymentService.managePoint(payment);
		
		System.out.println(result);
		
		User user = userService.getUser(9);
		
		// 가격 amount.total && amout.vat (부가세)
		// 수량 quantity
		// 승인일 approved_at
		// 결제 시작일 ? created_at
		/*
		 * approvedDate & point
		 * */
		model.addAllAttributes(result);
		model.addAttribute("user", user);
		model.addAttribute("totalPoint", paymentService.getPoint(userId));
		
		return "forward:/payment/chargeSuccessPoint.jsp";
	}
}

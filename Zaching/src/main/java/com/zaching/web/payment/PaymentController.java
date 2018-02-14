package com.zaching.web.payment;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

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
	
	@RequestMapping("exchargePoint")
	public String exchargePoint(HttpSession session, Model model) throws Exception {
		
		User user = userService.getAccountUser(((User)session.getAttribute("user")).getUserId());
		model.addAttribute("user", user)
			 .addAttribute("bank", paymentService.listBackCode());
		
		return "forward:/payment/exchargePoint.jsp";
	}

	@RequestMapping(value="mainPayment")
	public String mainPayment(@ModelAttribute Search search,
							HttpSession session,
							Model model) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(search);
		
		Map<String, Object> map = paymentService.listPoint(search, user.getUserId());
		
		int totalPoint = paymentService.getPoint(user.getUserId());
		int totalMileage = paymentService.getMileage(user.getUserId());
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		
		model.addAttribute("payment", map.get("list"))
			 .addAttribute("totalPoint", totalPoint)
			 .addAttribute("totalMileage", totalMileage)
			 .addAttribute("paymentPage", resultPage)
			 .addAttribute("bank", paymentService.listBackCode());
		
		return "forward:/payment/mainPayment.jsp";
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
								HttpSession session,
								Model model) throws Exception {
		
		int userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("pg_token :: "+pgToken);
		
		Map<String, Object> result = commonService.getPaymentApprove(null, pgToken);
		
		Payment payment = new Payment();
		payment.setPaymentCode("P01");
		payment.setPoint((int)result.get("point"));
		payment.setUserId(userId);
		payment.setContent("P01:none:카카오페이 충전");
		paymentService.managePoint(payment);
		
		System.out.println(result);
		
		User user = userService.getUser(userId);
		
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
	
	@RequestMapping("newAccount")
	public String tftcAccount(HttpSession session,
							@RequestParam String accountNum,
							@RequestParam int accountHolderinfo) throws Exception {
		
		System.out.println("이얍");
		
		/*
		User user = (User)session.getAttribute("user");
		
		String token = userService.updateGetAccountToken(null, user.getUserId());
		if(token==null || "".equals(token)) {
			return paymentService.getAuthorizationUrl(1);
		} else {
			return "redirect:/payment/getRealName?token="+token+"&accountNum="+accountNum
					+"&accountHolderinfo="+accountHolderinfo;
		}
		*/
		
		String token = paymentService.getAccessToken2();
		
		return "redirect:/payment/getRealName?token="+token+"&accountNum="+accountNum
				+"&accountHolderinfo="+accountHolderinfo;
	}
	
	@RequestMapping("/payment/oauthAccount")
	public String tftcAccountReturn(@RequestParam String code,
									@RequestParam String scope,
									@RequestParam String client_info,
									HttpSession session) throws Exception {

		System.out.println("요기왔다링");
		
		JSONObject json = paymentService.getAccessToken(code);
		
		String accessToken = json.get("access_token").toString();
		String userSeqNo = json.get("user_seq_no").toString();
		
		User sessionUser = (User)session.getAttribute("user");
		
		// 토큰 DB에 저장
		userService.updateGetAccountToken(accessToken, sessionUser.getUserId());
		
		String userCI = paymentService.getUserCI(accessToken, userSeqNo);
		
		// DB 저장,,
		session.setAttribute("userCI", userCI);
		session.setAttribute("userSeqNo", userSeqNo);

		// 성공페이지로 이동
		return "redirect:/payment/getAccessToken?accessToken="+accessToken+"&userSeqNo="+userSeqNo;
		
	}
	
	@RequestMapping("/payment/getUserNe")
	public String getUserNe(@RequestParam String accessToken,
									@RequestParam String userSeqNo,
									HttpSession session) throws Exception {


		//String userSeqNo = json.get("user_seq_no").toString();
		String userCI = paymentService.getUserCI(accessToken, userSeqNo);
		
		session.setAttribute("accountToken", accessToken);
		
		// DB 저장,,
		session.setAttribute("userCI", userCI);
		session.setAttribute("userSeqNo", userSeqNo);

		// 성공페이지로 이동
		return "redirect:/payment/getAccessToken?accessToken="+accessToken+"&userCI="+userCI;
		
	}
	
	
	@RequestMapping("/payment/getRealName")
	public String getRealName(@RequestParam String token,
							@RequestParam String accountNum,
							@RequestParam int accountHolderinfo,
							HttpSession session,
							Model model) throws Exception {
		
		User sessionUser = (User)session.getAttribute("user");
		
		Map<String, Object> map = paymentService.getAccountRealName(token, accountNum, accountHolderinfo);
		sessionUser.setAccountNumber((String)map.get("accountNum"));
		sessionUser.setRealName((String)map.get("realName"));
		sessionUser.setBankName((String)map.get("bankName"));
		
		if(sessionUser.getAccountNumber() != null) {
			userService.updateUser(sessionUser);
			model.addAttribute("result", "success");
		} else {
			model.addAttribute("result", "fail");
		}

		// 성공페이지로 이동
		return "redirect:/payment/registerAccount.jsp";
		
	}
}

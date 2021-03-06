package com.zaching.web.admin;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Search;
import com.zaching.service.payment.PaymentDao;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.report.ReportService;
import com.zaching.service.user.UserService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.Report;
import com.zaching.service.domain.User;

@Controller
@RequestMapping("/admin/rest/*")
public class AdminRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public AdminRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/blockUser", method=RequestMethod.POST)
	public String blockUser(@RequestBody Map<String, Object> map , HttpSession session) throws Exception {
	
		String userId = ((String)map.get("userId"));
		System.out.println(userId);
		
		User user = userService.getUser(Integer.parseInt(userId));
		
		user.setRole("0");
		
		System.out.println("11111111");
		user.setBirth("999999");
		System.out.println("222222222");
		user.setGender("2");
		System.out.println("333333333");
		user.setPhone1("010");
		user.setPhone2("010");
		user.setPhone3("010");
		System.out.println("4444444");
		user.setProfileImage("no");
		System.out.println("5555555");
		user.setAddress("비트");
		
		//나중에 data null 문제 해결해야함. mapper에
		
		
		System.out.println("66666666");
		System.out.println(user);
		
		userService.updateUser(user);
		//user null error
	
		
		System.out.println("22222222");


	
		return "";

	}
	
	
	@RequestMapping(value="/exchargePoint", method=RequestMethod.POST)
	public String exchargePoint(@RequestBody Map<String, Object> map, @ModelAttribute("payment") Payment payment) throws Exception {
		
		String paymentId = ((String)map.get("paymentID"));
		
		payment.setPaymentCode("P04");
		payment.setPaymentId(Integer.parseInt(paymentId));
		
		paymentService.managePoint(payment);


	
		return "";

	}
	
	
	@RequestMapping(value="/addReport", method=RequestMethod.POST)
	public String exchargePoint(@RequestBody Map<String, Object> map, @ModelAttribute("report") Report report) throws Exception {
		

		String category = ((String)map.get("category"));
		String userID = ((String)map.get("userID"));
		//String day = ((String)map.get("day"));
		//String flag = ((String)map.get("paymentID"));
		String text = ((String)map.get("text"));
		String reportUserID = ((String)map.get("reportUserID"));
		String roomID = ((String)map.get("roomID"));
		
		
		report.setCategory(category);
		report.setFlag('0');
		report.setReportUserID(Integer.parseInt(reportUserID));
		report.setRoomID(Integer.parseInt(roomID));
		report.setText(text);
		report.setUserID(Integer.parseInt(userID));

		reportService.addReport(report);
		
	
		return "";

	}
	
	@RequestMapping(value="/updateReport", method=RequestMethod.GET)
	public String updateReport(@RequestBody Map<String, Object> map, @ModelAttribute("report") Report report) throws Exception  {
		

		String reportId = ((String)map.get("reportId"));
		
		reportService.updateReport(Integer.parseInt(reportId));

		
	
		return "";

	}
	
	@RequestMapping(value="/alert", method=RequestMethod.POST)
	public String alert(@ModelAttribute Bob bob) throws Exception  {
		
		System.out.println("alert post");

		return "redirect:/admin/rest/alerttest?alert=1";

	}
	
	@RequestMapping(value="/alerttest", method=RequestMethod.GET)
	public String alerttest(@RequestParam int alert, Model model) throws Exception  {
		
		System.out.println("alert GET");
		System.out.println(alert);
		model.addAttribute("alert", alert);
		
		return "forward:/admin/test2.jsp";

	}


}

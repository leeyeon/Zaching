package com.zaching.web.admin;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.zaching.common.domain.Search;
import com.zaching.service.payment.PaymentDao;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.report.ReportService;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.Report;
import com.zaching.service.domain.User;

@Controller
@RequestMapping("/admin/rest/*")
public class AdminRestController {
	
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
	
	@RequestMapping(value="/blockUser", method=RequestMethod.GET)
	public String blockUser(Model model) throws Exception {
	
		return "";

	}
	
	@RequestMapping(value="/addReport", method=RequestMethod.GET)
	public String addReport(Model model) throws Exception {
	
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
		
		String reportID = ((String)map.get("reportID"));
		String category = ((String)map.get("category"));
		String userID = ((String)map.get("userID"));
		//String day = ((String)map.get("day"));
		//String flag = ((String)map.get("paymentID"));
		String text = ((String)map.get("text"));
		String reportUserID = ((String)map.get("reportUserID"));
		String roomID = ((String)map.get("roomID"));
		
		report.setCategory(category);
		report.setFlag('0');
		report.setReportID(Integer.parseInt(reportID));
		report.setReportUserID(Integer.parseInt(reportUserID));
		report.setRoomID(Integer.parseInt(roomID));
		report.setText(text);
		report.setUserID(Integer.parseInt(userID));
		
		reportService.addReport(report);


	
		return "";

	}
	
	@RequestMapping(value="/updateReport", method=RequestMethod.GET)
	public String updateReport(Model model) throws Exception  {
	
		return "";

	}

}

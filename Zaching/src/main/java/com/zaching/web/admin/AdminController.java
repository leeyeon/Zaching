package com.zaching.web.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.service.domain.User;
import com.zaching.service.payment.PaymentService;
import com.zaching.service.report.ReportService;
import com.zaching.service.user.UserService;
import com.zaching.common.domain.Search;
import com.zaching.common.domain.Page;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	
	//@Value("#{commonProperties['pageSize']}")
	//int pageSize;
	
	int pageSize = 3;


	public AdminController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
	public String adminLogin(@RequestBody User user, HttpSession session) throws Exception  {
		

			System.out.println("/adminLogin : POST");
			
			System.out.println("::"+user);
			
			User dbUser = userService.getUser(Integer.parseInt(user.getEmail()));
			
			
			if(user.getEmail().equals(dbUser.getEmail())) {
				session.setAttribute("user", dbUser);
				
				return "forward:/admin/mainAdmin.jsp";
			}
			else {
				return "redirect:/admin/adminLogin.jsp";
			}

	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(Model model) throws Exception {
	
		return "forward:/admin/adminLogin.jsp";

	}
	
	@RequestMapping(value="/getReport", method=RequestMethod.GET)
	public String getReport(Model model)  throws Exception {
	
		return "forward:/admin/getReport.jsp";

	}
	
	@RequestMapping(value="/listReport", method=RequestMethod.GET)
	public String listReport(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		// Business logic 수행
		List list = reportService.listReport(search);
		
	
		model.addAttribute("list", list);

	
		return "forward:/admin/listReport.jsp";

	}
	
	
	@RequestMapping(value="/listPoint", method=RequestMethod.GET)
	public String listPoint(@ModelAttribute("search") Search search, Model model)  throws Exception {
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		// Business logic 수행
		List list = paymentService.listExchargePoint(search);
		
	
		model.addAttribute("list", list);
	
		return "forward:/admin/listPoint.jsp";

	}
	
	
	
	@RequestMapping(value="/listUser")
	public String listPostUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(search);

		Map<String, Object> map = userService.listUser(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println(resultPage);
		
	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println(map.get("list"));
	
		return "forward:/admin/listUser.jsp";

	}

	
	@RequestMapping(value="/mainAdmin", method=RequestMethod.GET)
	public String mainAdmin(@ModelAttribute("search") Search search, Model model) {
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		// Business logic 수행
		//List list = paymentService.listExchargePoint(search);
		
	
		//model.addAttribute("list", list);
		
	
		return "forward:/admin/mainAdmin.jsp";

	}
	

}

package com.zaching.web.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.service.domain.User;

import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;


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
	public String logout(Model model) {
	
		return "forward:/admin/adminLogin.jsp";

	}
	
	@RequestMapping(value="/getReport", method=RequestMethod.GET)
	public String getReport(Model model) {
	
		return "forward:/admin/getReport.jsp";

	}
	
	@RequestMapping(value="/listReport", method=RequestMethod.GET)
	public String listReport(Model model) {
	
		return "forward:/admin/listReport.jsp";

	}
	
	
	@RequestMapping(value="/listPoint", method=RequestMethod.GET)
	public String listPoint(Model model) {
	
		return "forward:/admin/listPoint.jsp";

	}
	
	
	
	@RequestMapping(value="/listUser", method=RequestMethod.GET)
	public String listUser(Model model) {
	
		return "forward:/admin/admin/listUser.jsp";

	}

	
	@RequestMapping(value="/mainAdmin", method=RequestMethod.GET)
	public String mainAdmin(Model model) {
	
		return "forward:/admin/admin/mainAdmin.jsp";

	}
	

}

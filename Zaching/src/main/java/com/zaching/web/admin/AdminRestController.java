package com.zaching.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin/rest/*")
public class AdminRestController {

	public AdminRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/blockUser", method=RequestMethod.GET)
	public String blockUser(Model model) {
	
		return "";

	}
	
	@RequestMapping(value="/addReport", method=RequestMethod.GET)
	public String addReport(Model model) {
	
		return "";

	}
	
	@RequestMapping(value="/exchargePoint", method=RequestMethod.GET)
	public String exchargePoint(Model model) {
	
		return "";

	}
	
	@RequestMapping(value="/updateReport", method=RequestMethod.GET)
	public String updateReport(Model model) {
	
		return "";

	}

}

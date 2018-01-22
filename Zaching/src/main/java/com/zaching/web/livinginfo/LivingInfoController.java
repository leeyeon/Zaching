package com.zaching.web.livinginfo;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;


public class LivingInfoController {

	public LivingInfoController() {
		// TODO Auto-generated constructor stub
	}
	
	public String getAroundSearch(Model model) throws Exception {

		System.out.println("/getAroundSearch");
	
		return "forward:/livingInfo/getAroundSearch.jsp";
	}

}

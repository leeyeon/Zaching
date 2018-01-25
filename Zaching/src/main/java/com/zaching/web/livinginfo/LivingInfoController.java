package com.zaching.web.livinginfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/livingInfo/*")
public class LivingInfoController {

	public LivingInfoController() {
		System.out.println("/livingInfo");
	}
	
	@RequestMapping(value = "getAroundSearch", method = RequestMethod.GET)
	public String getAroundSearch(Model model) throws Exception {

		System.out.println("/getAroundSearch");
	
		return "forward:/livingInfo/getAroundSearch.jsp";
	}
	
	@RequestMapping(value = "getRentCharge", method = RequestMethod.GET)
	public String getRentCharge(Model model) throws Exception {

		System.out.println("/getRentCharge");
	
		return "forward:/livingInfo/getRentCharge.jsp";
	}
	
	@RequestMapping(value = "getEventInfo", method = RequestMethod.GET)
	public String getEventInfo(Model model) throws Exception {

		System.out.println("/getEventInfo");
	
		return "forward:/livingInfo/getEventInfo.jsp";
	}
	
	@RequestMapping(value = "getTravel", method = RequestMethod.GET)
	public String getTravel(Model model) throws Exception {

		System.out.println("/getTravel");
	
		return "forward:/livingInfo/getTravel.jsp";
	}
	
	@RequestMapping(value = "getNoticeInfo", method = RequestMethod.GET)
	public String getNoticeInfo(Model model) throws Exception {

		System.out.println("/getNoticeInfo");
	
		return "forward:/livingInfo/getNoticeInfo.jsp";
	}

}

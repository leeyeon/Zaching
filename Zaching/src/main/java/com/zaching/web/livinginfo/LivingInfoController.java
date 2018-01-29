package com.zaching.web.livinginfo;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.service.domain.LivingInfo;

@Controller
@RequestMapping("/livingInfo/*")
public class LivingInfoController {

	public LivingInfoController() {
		System.out.println("/livingInfo");
	}
	
	
	
	@RequestMapping(value = "getMovieInfo", method = RequestMethod.GET)
	public String getMovieInfo(@ModelAttribute("livingInfo") LivingInfo livingInfo, Model model) throws Exception {

		System.out.println("/getMovieInfo");
		
	
		

		return "forward:/livingInfo/getMovieInfo.jsp";
	}
	
	@RequestMapping(value = "getBestBook", method = RequestMethod.GET)
	public String getBestBook(Model model) throws Exception {

		System.out.println("/getBestBook");
		
		
		
		return "forward:/livingInfo/getBestBook.jsp";
	}
	

	
	@RequestMapping(value = "getRentCharge", method = RequestMethod.GET)
	public String getRentCharge(Model model) throws Exception {

		System.out.println("/getRentCharge");
	
		return "forward:/livingInfo/getRentCharge.jsp";
	}
	
	@RequestMapping(value = "getAroundSearch", method = RequestMethod.GET)
	public String getAroundSearch(Model model) throws Exception {

		System.out.println("/getAroundSearch");
	
		return "forward:/livingInfo/getAroundSearch.jsp";
	}
	
	@RequestMapping(value = "mainLivingInfo", method = RequestMethod.GET)
	public String mainLivingInfo(Model model) throws Exception {

		System.out.println("/mainLivingInfo");
	
		return "forward:/livingInfo/mainLivingInfo.jsp";
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

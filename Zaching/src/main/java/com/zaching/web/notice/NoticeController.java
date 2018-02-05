package com.zaching.web.notice;

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
@RequestMapping("/notice/*")
public class NoticeController {

	public NoticeController() {
		System.out.println("/notice");
	}
	
	
	
	@RequestMapping(value = "getBestBook", method = RequestMethod.GET)
	public String getBestBook(Model model) throws Exception {

		System.out.println("/getBestBook");
		
		
		
		return "forward:/livingInfo/getBestBook.jsp";
	}
	

	
}

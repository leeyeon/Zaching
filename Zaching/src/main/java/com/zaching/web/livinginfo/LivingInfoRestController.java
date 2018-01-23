package com.zaching.web.livinginfo;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/livingInfo/*")
public class LivingInfoRestController {
	

	public LivingInfoRestController() {
		System.out.println("/livingInfo/rest/");
		


	}
	
	
	
	
	@RequestMapping( value="rest/rentcharge/{location}", method=RequestMethod.GET )
	public String rentcharge(	@PathVariable String location, HttpSession session ) throws Exception{

		System.out.println("/livingInfo/rest/rentcharge: get");
		
		BufferedReader br = null;
		String locationCode = null;
		
		File file = new File("C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\src\\main\\resources\\config\\rentcharge.txt");
		
		br = new BufferedReader(new FileReader(file));
		
		location = location.split(" ")[1];
		System.out.println(location);
		while(br.readLine() != null) {
			if(br.readLine().indexOf(location) != -1) {
				locationCode = br.readLine().substring(0, 5);
				break;
			}
			
		}
		System.out.println(locationCode);


	
		
		
		return locationCode;
	}

}

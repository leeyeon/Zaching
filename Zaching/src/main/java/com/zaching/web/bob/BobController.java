package com.zaching.web.bob;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/bob/*")
public class BobController {

	public BobController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.GET)
	public String addBobView() {
		System.out.println(this.getClass()+"/addBob_ GET");
		
		return "forward:/bob/addBob.jsp";
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.POST)
	public String addBob(@RequestParam String category, Model model) {
		System.out.println(this.getClass()+"/addBob_ POST");
		
		//model.addAttribute("categoryName", categoryName);
		
		return "forward:/bob/getBob.jsp";
	}
	
	@RequestMapping("/getBob")
	public String getBob(Model model) {
		System.out.println(this.getClass()+"/getBob");
		
		// 우리지금만나
		String category = "B01";
		
		model.addAttribute("category", category);
		
		return "forward:/bob/getBob.jsp";
	}

	@RequestMapping("/listBob")
	public String listBob() {
		System.out.println(this.getClass()+"/listBob");
		
		return "forward:/bob/listBob.jsp";
	}

	@RequestMapping("/updateBob")
	public String updateBob() {
		System.out.println(this.getClass()+"/updateBob");
		
		return "forward:/bob/updateBob.jsp";
	}
}

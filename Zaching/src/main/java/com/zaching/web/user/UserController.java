
package com.zaching.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/*")
public class UserController {

	public UserController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="test")
	public String test() {
		System.out.println("¤·¤µ¤·");
		
		return "redirect:/user/addProduct.jsp";
	}
	
	

}


package com.zaching.web.user;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	
	///Field
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		//setter Method 구현 않음
			
		public UserController(){
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		@RequestMapping( value="findPassword", method=RequestMethod.GET )
		public String findPassword() throws Exception{
		
			System.out.println("/user/findPassword : GET");
			
			return "redirect:/user/findPassword.jsp";
		}
		
		
		@RequestMapping( value="addUser", method=RequestMethod.GET )
		public String addUser() throws Exception{
		
			System.out.println("/user/addUser : GET");
			
			return "redirect:/user/addUser.jsp";
		}
		
		@RequestMapping( value="addUser", method=RequestMethod.POST )
		public String addUser( @ModelAttribute("user") User user ) throws Exception {

			System.out.println("/user/addUser : POST");
			//Business Logic
			userService.addUser(user);
			
			return "redirect:/user/login.jsp";
		}
		

		@RequestMapping( value="getUser", method=RequestMethod.GET )
		public String getUser( @RequestParam("userId") int userId , Model model ) throws Exception {
			
			System.out.println("/user/getUser : GET");
			//Business Logic
			User user = userService.getUser(userId);
			// Model 과 View 연결
			model.addAttribute("user", user);
			
			return "forward:/user/getUser.jsp";
		}
	
	

}

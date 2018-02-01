package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	//Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public User login( @RequestBody User user,
				HttpSession session	)throws Exception{
		
		System.out.println("/user/json/login : POST");
		
		System.out.println("::"+user);
		
		
		User dbUser=userService.login(user.getEmail());
		System.out.println("::::: "+dbUser);
		
		
		System.out.println("=====>  "+session);
		if(user.getPassword().equals(dbUser.getPassword()) &&
				user.getEmail().equals(dbUser.getEmail())) {
			session.setAttribute("user", dbUser);
		}
		System.out.println("비교===>"+user.getEmail()+" = "+dbUser.getEmail());
		System.out.println("비교===>"+user.getPassword()+" = "+dbUser.getPassword());
		
		return dbUser;
	}
	
	

}

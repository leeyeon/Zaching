package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/*")
public class LoginController {
	
	/// Field
		@Autowired
		@Qualifier("commonServiceImpl")
		private CommonService commonService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		public LoginController() {
			System.out.println(this.getClass());
		}

		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		//
		@RequestMapping(value="kakaoLogin",method=RequestMethod.GET)
		public String KakaoLoginCode(@RequestParam("code") String code,
									HttpSession session)throws Exception {
			
			System.out.println("/user/kakaoLogin/code");
			
			
			Map<String, Object> map = commonService.getAceessToken2(code);
			System.out.println("code====> "+code);
			User user= new User();
			
			user.setAccessToken((String)map.get("accessToken"));
			user=commonService.getUserInfo(user);
			
			System.out.println("user ====>"+user);
			
			return code;
		}

}

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
		
		
		@RequestMapping(value= "kakaoLoginRequest", method=RequestMethod.GET)
		public String kakaoLoginRequest() {
			
			System.out.println("[ kakao Login Request!! ]");
			
			return commonService.getAuthorizationUrl_login();
			
		}

		//
		@RequestMapping(value="kakaoLogin",method=RequestMethod.GET)
		public String KakaoLogin(@RequestParam("code") String code,
									HttpSession session)throws Exception {
			
			System.out.println("/kakaoLogin/code");
			
			User sessionUser = (User)session.getAttribute("user");
			
			if(sessionUser.getAccessToken() == null) {
				
				sessionUser.setAccessToken("kakaoPay");
				
				session.setAttribute("user", sessionUser);
				
				return "redirect:/payment/mainPayment";
				
			} else if(((User)session.getAttribute("user")).getAccessToken().equals("kakaoPay")) {
				return null;
			} else {
			
				User user = commonService.getAceessToken2(code);
				user = commonService.getUserInfo(user);
				
				
				if(userService.login(user.getEmail()) == null) {
					
					userService.addUser(user);
				}
				
				session.setAttribute("user", user);
				
				System.out.println("session 저장정보===>"+session.getAttribute("user"));
				System.out.println("이메일 ==> "+user.getEmail());
				System.out.println("프로필 이미지 ==> "+user.getProfileImage());
				
				return "forward:/index.jsp";
			}
		}

}

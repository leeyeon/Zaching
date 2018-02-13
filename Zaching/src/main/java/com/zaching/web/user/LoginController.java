package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.User;
import com.zaching.service.user.GoogleService;
import com.zaching.service.user.NaverService;
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

	@Autowired
	@Qualifier("naverServiceImpl")
	private NaverService naverService;
	
	
	@Autowired
	@Qualifier("googleServiceImpl")
	private GoogleService googleService;


	public LoginController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "kakaoLoginRequest", method = RequestMethod.GET)
	public String kakaoLoginRequest(HttpSession session) {

		System.out.println("[ kakao Login Request!! ]");

		return commonService.getAuthorizationUrl_login(session);

	}

	//
	@RequestMapping(value = "kakaoLogin", method = RequestMethod.GET)
	public String KakaoLogin(@RequestParam("code") String code,
							Model model,HttpSession session) throws Exception {

		System.out.println("/kakaoLogin/code");

		
		User sessionUser = (User)session.getAttribute("user");
		
		//System.out.println(sessionUser);
		
		/* 카카오페이 때 로그인하는 거 때문에 만듦!!! */
		if(sessionUser.getAccessToken() == null) { 
			
			//System.out.println("여기까지 왔군욤");
			
			sessionUser.setAccessToken("kakaoPay");
			
			session.setAttribute("user", sessionUser);
			
			return "redirect:/payment/mainPayment";
			
		} else {
			User user = commonService.getAceessToken2(code,session);
			user = commonService.getUserInfo(user);
	
			session.setAttribute("user", user);
			
			/*if(user.getEmail() != sessionUser.getEmail()) {
				userService.snsAddUser(user); //세션정보 DB에 저장
			}*/
			System.out.println("session 저장정보===>" + session.getAttribute("user"));
			System.out.println("이메일 ==> " + user.getEmail());
			System.out.println("프로필 이미지 ==> " + user.getProfileImage());
	
			return "forward:/index.jsp";
		}


	}

	@RequestMapping(value = "naverLoginRequest", method = RequestMethod.GET)
	public String naverLoginRequest(HttpSession session) {

		System.out.println("[ Naver Login Request!! ]");
		
		

		return naverService.getAuthorizationUrl_login(session);

	}

	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String naverLogin(@RequestParam("code") String code,
							 @RequestParam("state") String state,Model model,
							 HttpSession session) throws Exception {

		System.out.println("naverLogin/code받아서 토큰 요청하ㅣ");

		User user = naverService.getAccessToken(session, code, state);
		user = naverService.getUserProfile(user);
		
		//userService.snsAddUser(user);
		System.out.println("code ==>"+code);
		System.out.println("state  ==>"+state);
		System.out.println("user정보 ==>"+user);
		
		
	
		System.out.println("session 저장정보===>" + session.getAttribute("user"));
		System.out.println("이메일 ==> " + user.getEmail());
		System.out.println("프로필 이미지 ==> " + user.getProfileImage());

		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "googleLoginRequest", method = {RequestMethod.GET,RequestMethod.POST})
	public String GoogleLoginRequest(HttpSession session) {

		System.out.println("[ Google Login Request!! ]");

		return googleService.getAuthorizationUrl(session);

	}
	
	@RequestMapping(value="googleLogin",method={RequestMethod.GET,RequestMethod.POST})
	public String googleLogin(@RequestParam("code") String code,Model model,
							HttpSession session)throws Exception{
		System.out.println(":: GoogleLogin ::");
		
		User user = googleService.getAccessToken(session, code);
		user = googleService.getUserProfile(user);
		
		session.setAttribute("user", user);
	/*	userService.snsAddUser(user);
*/		System.out.println("session==> "+session.getAttribute("user"));
		System.out.println("google 이메일 ==> " + user.getEmail());
		System.out.println("프로필 이미지 ==> " + user.getProfileImage());
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "facebookLoginRequest", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLoginRequest(HttpSession session) {

		System.out.println("[ facebookLogin Request!! ]");

		return commonService.getAuthorizationUrl_facebook(session);

	}
	
	
	@RequestMapping(value = "facebookLogin", method = {RequestMethod.GET,RequestMethod.POST})
	public String facebookLogin(@RequestParam("code") String code,Model model,
								HttpSession session, String state)throws Exception {

		System.out.println("[ facebookLogin 토큰/사용자정보 받기!! ]");
		//String accesstoken = commonService.getAccessToken_facebook(session, code);
		//		commonService.getUserProfile(accesstoken, session);
		
		User user =commonService.getAccessToken_facebook(session, code);
		user =commonService.getUserProfile(user);
		
		session.setAttribute("user", user);
		userService.snsAddUser(user);
		System.out.println("session==> "+session.getAttribute("user"));
		System.out.println("facebook 이메일 ==> " + user.getEmail());
		System.out.println("프로필 이미지 ==> " + user.getProfileImage());
	

		return "redirect:/index.jsp";

	}


}

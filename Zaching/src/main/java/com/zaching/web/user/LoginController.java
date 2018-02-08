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
	public String kakaoLoginRequest() {

		System.out.println("[ kakao Login Request!! ]");

		return commonService.getAuthorizationUrl_login();

	}

	//
	@RequestMapping(value = "kakaoLogin", method = RequestMethod.GET)
	public String KakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {

		System.out.println("/kakaoLogin/code");

		
		User sessionUser = (User)session.getAttribute("user");
		
		//System.out.println(sessionUser);
		
		/* īī������ �� �α����ϴ� �� ������ ����!!! */
		if(sessionUser.getAccessToken() == null) { 
			
			//System.out.println("������� �Ա���");
			
			sessionUser.setAccessToken("kakaoPay");
			
			session.setAttribute("user", sessionUser);
			
			return "redirect:/payment/mainPayment";
			
		} else {
			User user = commonService.getAceessToken2(code);
			user = commonService.getUserInfo(user);
	
			session.setAttribute("user", user);
	
			System.out.println("session ��������===>" + session.getAttribute("user"));
			System.out.println("�̸��� ==> " + user.getEmail());
			System.out.println("������ �̹��� ==> " + user.getProfileImage());
	
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

		System.out.println("naverLogin/code�޾Ƽ� ��ū ��û�Ϥ�");

		User user = naverService.getAccessToken(session, code, state);
		user = naverService.getUserProfile(user);
		
		System.out.println("code ==>"+code);
		System.out.println("state  ==>"+state);
		System.out.println("user���� ==>"+user);
		
		
	
		System.out.println("session ��������===>" + session.getAttribute("user"));
		System.out.println("�̸��� ==> " + user.getEmail());
		System.out.println("������ �̹��� ==> " + user.getProfileImage());

		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "googleLoginRequest", method = RequestMethod.GET)
	public String GoogleLoginRequest() {

		System.out.println("[ Google Login Request!! ]");

		return googleService.getAuthorizationUrl();

	}
	
	@RequestMapping(value="googleLogin",method=RequestMethod.GET)
	public String googleLogin(@RequestParam("code") String code,
							HttpSession session)throws Exception{
		
		User user = googleService.getAccessToken(session, code);
		user = googleService.getUserProfile(user);
		
		System.out.println("�H����"+user);
		
		
		return "forward:/index.jsp";
	}


}

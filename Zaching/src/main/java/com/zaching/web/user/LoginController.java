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
	public String KakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {

		System.out.println(this.getClass()+"/kakaoLogin/code");
		
		User sessionUser = (User) session.getAttribute("user");

		// �α��εǾ� ���� ���� ����, īī���α������� ���ߵ�
		if(sessionUser == null) {
			
			User user = commonService.getAceessToken2(code, session);
			user = commonService.getUserInfo(user);
			boolean result = userService.snsCheck(user.getEmail(), user.getSnsType());

			// System.out.println("�޾ƿ�����"+user.getSnsType());
			if (result == true) {// �̸��������� db�� �������

				session.setAttribute("user", user);
				userService.snsAddUser(user);// snstype���� ȸ������

				System.out.println("īī���������� ȸ������");
			} else{
				session.setAttribute("user", user);

				System.out.println("īī���������� �α���");
			}
			
			return "forward:/index.jsp";
		
		} else {
			//īī������
			
			sessionUser.setAccessToken("kakaoPay");
			session.setAttribute("user", sessionUser);
			
			System.out.println("īī������");

			return "redirect:/payment/mainPayment?kakaologin=true";
		}

	}

	@RequestMapping(value = "naverLoginRequest", method = RequestMethod.GET)
	public String naverLoginRequest(HttpSession session) {

		System.out.println("[ Naver Login Request!! ]");

		return naverService.getAuthorizationUrl_login(session);

	}

	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String naverLogin(@RequestParam("code") String code, @RequestParam("state") String state, Model model,
			HttpSession session) throws Exception {

		System.out.println("naverLogin/code�޾Ƽ� ��ū ��û�Ϥ�");

		User user = naverService.getAccessToken(session, code, state);
		user = naverService.getUserProfile(user);

		boolean result = userService.snsCheck(user.getEmail(), user.getSnsType());

		// System.out.println("�޾ƿ�����"+user.getSnsType());
		if (result == true) {// �̸��������� db�� �������

			session.setAttribute("user", user);
			userService.snsAddUser(user);// snstype���� ȸ������

			System.out.println("���̹��������� ȸ������");
		} else  {
			session.setAttribute("user", user);

			System.out.println("���̹��������� �α���");
		}

		// userService.snsAddUser(user);
		System.out.println("code ==>" + code);
		System.out.println("state  ==>" + state);
		System.out.println("user���� ==>" + user);

		System.out.println("session ��������===>" + session.getAttribute("user"));
		System.out.println("�̸��� ==> " + user.getEmail());
		System.out.println("������ �̹��� ==> " + user.getProfileImage());

		return "forward:/index.jsp";
	}

	@RequestMapping(value = "googleLoginRequest", method = { RequestMethod.GET, RequestMethod.POST })
	public String GoogleLoginRequest(HttpSession session) {

		System.out.println("[ Google Login Request!! ]");

		return googleService.getAuthorizationUrl(session);

	}

	@RequestMapping(value = "googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
		System.out.println(":: GoogleLogin ::");

		User user = googleService.getAccessToken(session, code);
		user = googleService.getUserProfile(user);

		boolean result = userService.snsCheck(user.getEmail(), user.getSnsType());

		// System.out.println("�޾ƿ�����"+user.getSnsType());
		if (result == true) {// �̸��������� db�� �������

			session.setAttribute("user", user);
			userService.snsAddUser(user);// snstype���� ȸ������

			System.out.println("���۰������� ȸ������");
		} else{
			session.setAttribute("user", user);

			System.out.println("���۰������� �α���");
		}
		
		System.out.println("session==> " + session.getAttribute("user"));
		System.out.println("google �̸��� ==> " + user.getEmail());
		System.out.println("������ �̹��� ==> " + user.getProfileImage());

		return "forward:/index.jsp";
	}

	@RequestMapping(value = "facebookLoginRequest", method = { RequestMethod.GET, RequestMethod.POST })
	public String facebookLoginRequest(HttpSession session) {

		System.out.println("[ facebookLogin Request!! ]");

		return commonService.getAuthorizationUrl_facebook(session);

	}

	@RequestMapping(value = "facebookLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String facebookLogin(@RequestParam("code") String code, Model model, HttpSession session, String state)
			throws Exception {

		System.out.println("[ facebookLogin ��ū/��������� �ޱ�!! ]");

		User user = commonService.getAccessToken_facebook(session, code);
		user = commonService.getUserProfile(user);

		boolean result = userService.snsCheck(user.getEmail(), user.getSnsType());

		// System.out.println("�޾ƿ�����"+user.getSnsType());
		if (result == true) {// �̸��������� db�� �������

			session.setAttribute("user", user);
			userService.snsAddUser(user);// snstype���� ȸ������

			System.out.println("���̽��ϰ������� ȸ������");
		} else {
			session.setAttribute("user", user);

			System.out.println("���̽��ϰ������� �α���");
		}
		System.out.println("session==> " + session.getAttribute("user"));
		System.out.println("facebook �̸��� ==> " + user.getEmail());
		System.out.println("������ �̹��� ==> " + user.getProfileImage());

		return "redirect:/index.jsp";

	}

}

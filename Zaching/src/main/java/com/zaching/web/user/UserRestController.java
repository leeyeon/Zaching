package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	
	/*
	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public User login( @RequestBody User user, HttpSession session	)throws Exception{
		
		System.out.println("/user/json/login : POST");
		
		System.out.println("::"+user);
		
		
		User dbUser=userService.login(user.getEmail());
		System.out.println("::::: "+dbUser);
		
		
		System.out.println("=====>  "+session);
		if(user.getPassword().equals(dbUser.getPassword()) &&
				user.getEmail().equals(dbUser.getEmail())) {
			session.setAttribute("user", dbUser);

	// 이메일 인증
		@RequestMapping(value = "json/emailAuth", method = RequestMethod.POST)
		public User emailAuth(HttpServletRequest request,
						HttpSession session) throws Exception {

			System.out.println("/user/json/emailAuth : POST");

			String email = request.getParameter("email");
			String authNum="";//보내 인증번호
			
			authNum = RandomNum();
			
			User getSessionUser = (User)session.getAttribute("user");
			
			System.out.println("getSessionUser :: "+getSessionUser);
			
			System.out.println("받는사람 email 정보==>" + email);
			System.out.println("새로생성한 인증번호==> "+authNum);
			
			getSessionUser.setAuthNum(authNum);
			userService.sendMail(email, authNum);
			
			System.out.println("DB인증번호 ===> "+getSessionUser.getAuthNum());
			
			session.setAttribute("user", getSessionUser);
			
			System.out.println("setSessionUser :: "+getSessionUser);

			return getSessionUser;

		}


		// 난수발생 메소드
				public String RandomNum() {

					StringBuffer buffer = new StringBuffer();
					for (int i = 0; i <= 6; i++) {
						int n = (int) (Math.random() * 10);
						buffer.append(n);
					}
					return buffer.toString();
				}
*/
	
	@RequestMapping(value="/rest/memoryMap/{userId}", method=RequestMethod.GET)
	public String memoryMap( @PathVariable int userId, HttpSession session)throws Exception{

		System.out.println(userId);
		
		//데이터 아래 형식으로 나타냄.
		
		
		return "{\"positions\":[{\"lat\": 37.3733103146403,\"lng\": 127.43708794867802,\"imgsrc\": \"/resources/images/user-icon.png\"},{\"lat\": 37.1627912237388,\"lng\": 128.99580192447536,\"imgsrc\": \"/resources/images/author.png\"},{\"lat\": 36.93980515531936,\"lng\": 128.8060765485201,\"imgsrc\": \"/resources/upload_files/images/main@2x.png\"},"
				+ "{\"lat\": 37.27943075229118,\"lng\": 127.01763998406159,\"imgsrc\": \"/resources/images/profile_test.png\"},{\"lat\": 37.55915668706214,\"lng\": 126.92536526611102,\"imgsrc\": \"/resources/images/test_2.jpg\"}]}";
	}
	
	
	

}

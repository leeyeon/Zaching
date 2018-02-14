package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.service.domain.User;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;

	public UserRestController() {
		System.out.println(this.getClass());
	}



	//이메일 인증
	@RequestMapping(value = "json/emailAuth", method = RequestMethod.POST )
	public User emailAuth(@RequestBody Map<String, Object> map,
			HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/user/json/emailAuth : POST");


		String inputEmail = (String)map.get("inputEmail");
		String authNum = "";// 보내 인증번호

		authNum = RandomNum();

		User getSessionUser = (User) session.getAttribute("user");

		System.out.println("getSessionUser :: " + getSessionUser);

		System.out.println("받는사람 email 정보==>" + inputEmail);
		System.out.println("새로생성한 인증번호==> " + authNum);

		getSessionUser.setAuthNum(authNum);
		getSessionUser.setEmail(inputEmail);

		userService.sendMail(inputEmail, authNum);

		System.out.println("DB인증번호 ===> " + getSessionUser.getAuthNum());
		System.out.println("DB이메일 ===> " + getSessionUser.getEmail());

		session.setAttribute("user", getSessionUser);

		System.out.println("getSessionUser :: " + getSessionUser);

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
	@RequestMapping(value="json/authNum", method=RequestMethod.POST)
	public String authNum(@RequestBody Map<String, Object> map,
			
			HttpServletRequest request,HttpSession session)throws Exception{
		
		System.out.println("/user/json/authNum : POST");
		
		String authNum=(String)map.get("authNum");//입력받은 인증번호
		
		System.out.println("입력받은 인증번호 ==> "+authNum);
		
		User getSessionAuth = (User)session.getAttribute("user");//세션에 있는 정보
		System.out.println("세션정보 ==> "+getSessionAuth);
		
		if(authNum.equals(getSessionAuth.getAuthNum())) {
			System.out.println("Before updateRole===> "+getSessionAuth);
			userService.updateRole(getSessionAuth);
			System.out.println("After updateRole===> "+getSessionAuth.getRole());
		
		}
		
		return "";
	}
	

	
	@RequestMapping(value="/rest/memoryMap/{userId}", method=RequestMethod.GET)
	public String memoryMap( @PathVariable int userId, HttpSession session)throws Exception{

		System.out.println(userId);
		//뉴스피드 게시물 가져오기 .게시물의 위도 경도 가져오기
		
		//게시물 이미지 경로 가져오기
		
		//데이터 아래 형식으로 나타냄.
		
		
		return "{\"positions\":[{\"lat\": 37.3733103146403,\"lng\": 127.43708794867802,\"imgsrc\": \"/resources/images/user-icon.png\"},{\"lat\": 37.1627912237388,\"lng\": 128.99580192447536,\"imgsrc\": \"/resources/images/author.png\"},{\"lat\": 36.93980515531936,\"lng\": 128.8060765485201,\"imgsrc\": \"/resources/upload_files/images/main@2x.png\"},"
				+ "{\"lat\": 37.27943075229118,\"lng\": 127.01763998406159,\"imgsrc\": \"/resources/images/profile_test.png\"},{\"lat\": 37.55915668706214,\"lng\": 126.92536526611102,\"imgsrc\": \"/resources/images/test_2.jpg\"}]}";
	}
	

	
	
	//파일업로드
	@RequestMapping(value="upload",method=RequestMethod.GET)
	public String ProfileUpload(@RequestParam("userId") int userId,
			@RequestBody Map<String, Object> map)throws Exception{
		
		
		System.out.println("/user/ProfileUpload : GET");
		
		String profileImage =(String)map.get("profileImage");
		
		System.out.println("업로드한 파일 이름====> "+profileImage);
		
		User user =userService.getUser(userId);
		
		user.setProfileImage(profileImage);
		
		userService.updateUser(user);
		
		return profileImage;
	}
	
	
	//이메일 중복체크
	@RequestMapping(value="/rest/checkSingup", method=RequestMethod.POST)
	public boolean checkSingup(HttpServletRequest request,
							@RequestBody Map<String , Object> map)throws Exception{
		   
		System.out.println("/user/rest/checkSignup");
		String email =(String)map.get("checkEmail");
		System.out.println("===> "+email);
		boolean result = userService.checkSignup(email);
	        
		System.out.println("rowCount ===> "+result);
		
		return result;
	}


	
	@RequestMapping(value="/rest/androidLogin")
	public String androidLogin( @RequestBody String loginInfomation, HttpSession session)throws Exception{
	
		String loginInfo[] = loginInfomation.split("&");
		
		String email = loginInfo[0];
		String password = loginInfo[1];
				
		User dbUser = userService.login(email);
		

		if (password.equals(dbUser.getPassword()) && email.equals(dbUser.getEmail())) {
			session.setAttribute("user", dbUser);
			return "{\"status\":\"yes\",\"userId\":\""+dbUser.getUserId()+"\"}";
		}
		else {
			return "{\"status\":\"no\"}";
		}			
		
	}
	
	@RequestMapping(value="/rest/androidAddUser")
	public String androidAddUser( @RequestBody String joinInfomation, @ModelAttribute("user") User user)throws Exception{
		System.out.println("와떠용");
		String loginInfo[] = joinInfomation.split("&");
		
		String email = loginInfo[0].trim();
		String password = loginInfo[1].trim();
		String password2 = loginInfo[2].trim();
		String name = loginInfo[3].trim();
		
		System.out.println(password);
		System.out.println(password2);
		
		if(password.equals(password2)) {

			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			user.setRole("1");
			userService.addUser(user);
			
			return "{\"status\":\"yes\"}";
		}
		else {
		
			return "{\"status\":\"no\"}";
		}
				
	
	}


}

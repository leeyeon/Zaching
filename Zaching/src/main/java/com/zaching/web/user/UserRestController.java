package com.zaching.web.user;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sun.javafx.sg.prism.NGShape.Mode;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Newsfeed;
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
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;

	public UserRestController() {
		System.out.println(this.getClass());
	}
	//"C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\"

	private String fileDirectory = "C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";

	//이메일인증
	@RequestMapping(value = "json/emailAuth", method = RequestMethod.POST )
	public User emailAuth(@RequestBody Map<String, Object> map,
			HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/user/json/emailAuth : POST");


		String inputEmail = (String)map.get("inputEmail");
		String authNum = "";// ���� ������ȣ

		authNum = RandomNum();

		User getSessionUser = (User) session.getAttribute("user");

		System.out.println("getSessionUser :: " + getSessionUser);

		System.out.println("�޴»�� email ����==>" + inputEmail);
		System.out.println("���λ����� ������ȣ==> " + authNum);

		getSessionUser.setAuthNum(authNum);
		getSessionUser.setEmail(inputEmail);

		userService.sendMail(inputEmail, authNum);

		System.out.println("DB������ȣ ===> " + getSessionUser.getAuthNum());
		System.out.println("DB�̸��� ===> " + getSessionUser.getEmail());

		session.setAttribute("user", getSessionUser);

		System.out.println("getSessionUser :: " + getSessionUser);

		return getSessionUser;
	}

	// 난수생성
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
		
		String authNum=(String)map.get("authNum");//�Է¹��� ������ȣ
		
		System.out.println("�Է¹��� ������ȣ ==> "+authNum);
		
		User getSessionAuth = (User)session.getAttribute("user");//���ǿ� �ִ� ����
		System.out.println("�������� ==> "+getSessionAuth);
		
		if(authNum.equals(getSessionAuth.getAuthNum())) {
			System.out.println("Before updateRole===> "+getSessionAuth);
			userService.updateRole(getSessionAuth);
			System.out.println("After updateRole===> "+getSessionAuth.getRole());
		
		}
		
		return "";
	}
	

	//추억지도
	@RequestMapping(value="/rest/memoryMap/{userId}", method=RequestMethod.GET)
	public String memoryMap(@PathVariable int userId)throws Exception{

		System.out.println(userId);
		
		List<Newsfeed> list = newsfeedService.listMemoryMap(userId);
		
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
		
		for (Newsfeed newsfeed : list) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("newsfeedId", newsfeed.getNewsfeedId());
			jsonObj.put("lng", newsfeed.getLocationY());
			jsonObj.put("lat", newsfeed.getLocationX());
			jsonObj.put("imgsrc", "/resources/upload_files/images/"+newsfeed.getFileName());
			array.add(jsonObj);
		}
		
		obj.put("positions", array);
		
		System.out.println(obj.toJSONString());
		
		return obj.toJSONString();

	}
	

	
	
	//프로필사진 업데이트
	@RequestMapping(value="/fileupload",method=RequestMethod.POST)
	public String ProfileUpload(@RequestParam("userId") int userId,
			@RequestBody Map<String, Object> map)throws Exception{
		
		
		System.out.println("/user/fileupload : GET");
		
		String profileImage =(String)map.get("formdata");
		
		System.out.println("업로드한 프로필사진 이름====> "+profileImage);
		
		User user =userService.getUser(userId);
/*
		commonService.addFile(fileDirectory, uploadFile);
		user.setProfileImage(profileImage);
*/		
		userService.updateUser(user);
		
		return profileImage;
	}
	
	
	//회원가입 이메일 중복쳌ㅡ
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

	//회원탈퇴
	@RequestMapping(value="/rest/deleteUser",method=RequestMethod.POST)
	public String deleteUser(HttpServletRequest request, 
			@RequestBody Map<String, Object> map, 
			HttpSession session)throws Exception{
		
		System.out.println("/user/rest/deleteUser :POST");
		
		String password =(String)map.get("password");
		System.out.println("�Է¹��� password ===>" +password);
		
		User getSession = (User)session.getAttribute("user");//���ǿ� �ִ� ����
		System.out.println("�������� ==> "+getSession);
		
		if(password.equals(getSession.getPassword())) {
			System.out.println("Before updateRole===> "+getSession.getRole());
			getSession.setRole("0");
			userService.updateRole(getSession);
			System.out.println("After updateRole===> "+getSession.getRole());
		
		}
		return"";
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
		System.out.println(this.getClass()+"/rest/androidAddUser");
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
			
			return "{\"status\":\"yes\",\"userId\":\"userId\"}";
		}
		else {
		
			return "{\"status\":\"no\"}";
		}
	}
	
	@RequestMapping(value="/rest/androidSetFCMToken", method=RequestMethod.POST)
	@ResponseBody
	public User androidSetFCMToken(@RequestBody Map<String, Object> map) throws Exception{
		System.out.println(this.getClass()+"/rest/androidSetFCMToken");
		//System.out.println(str);
		System.out.println(map.get("userId")+"//"+map.get("fcmToken"));
		
		int userId = Integer.parseInt(map.get("userId").toString());
		
		//System.out.println(userId);
		
		User user = userService.getUser(userId);
		
		//System.out.println(user);
		
		userService.setFCMToken(user.getUserId(), map.get("fcmToken").toString());	

		return user;
	}
	

	@RequestMapping(value="/rest/addUser", method=RequestMethod.POST)
	public User addUser(HttpServletRequest request,
						@RequestBody Map<String, Object> map,
						@ModelAttribute("user")User user, Model model)throws Exception{
		
		System.out.println("/user/rest/addUser : POST ");
		
		String email =(String)map.get("email");
		String name = (String)map.get("name");
		String password =(String)map.get("password");
		
		
		
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setRole("1");
		userService.addUser(user);
		model.addAttribute("user", user);
		
		System.out.println("name : " + user.getEmail());
		System.out.println("name : " + user.getPassword());
		System.out.println("name : " + user.getName());
		
		return user;
		
	}
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable int userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}



}

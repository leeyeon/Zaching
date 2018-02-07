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
import com.zaching.service.user.UserDao;
import com.zaching.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserRestController() {
		System.out.println(this.getClass());
	}



	//�̸��� ����
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

	// �����߻� �޼ҵ�
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
	

	
	@RequestMapping(value="/rest/memoryMap/{userId}", method=RequestMethod.GET)
	public String memoryMap( @PathVariable int userId, HttpSession session)throws Exception{

		System.out.println(userId);
		
		//������ �Ʒ� �������� ��Ÿ��.
		
		
		return "{\"positions\":[{\"lat\": 37.3733103146403,\"lng\": 127.43708794867802,\"imgsrc\": \"/resources/images/user-icon.png\"},{\"lat\": 37.1627912237388,\"lng\": 128.99580192447536,\"imgsrc\": \"/resources/images/author.png\"},{\"lat\": 36.93980515531936,\"lng\": 128.8060765485201,\"imgsrc\": \"/resources/upload_files/images/main@2x.png\"},"
				+ "{\"lat\": 37.27943075229118,\"lng\": 127.01763998406159,\"imgsrc\": \"/resources/images/profile_test.png\"},{\"lat\": 37.55915668706214,\"lng\": 126.92536526611102,\"imgsrc\": \"/resources/images/test_2.jpg\"}]}";
	}
	
	
	//���Ͼ��ε�
	@RequestMapping(value="upload",method=RequestMethod.GET)
	public String ProfileUpload(@RequestParam("userId") int userId,
			@RequestBody Map<String, Object> map)throws Exception{
		
		
		System.out.println("/user/ProfileUpload : GET");
		
		String profileImage =(String)map.get("profileImage");
		
		System.out.println("���ε��� ���� �̸�====> "+profileImage);
		
		User user =userService.getUser(userId);
		
		user.setProfileImage(profileImage);
		
		userService.updateUser(user);
		
		return profileImage;
	}
	
	


}

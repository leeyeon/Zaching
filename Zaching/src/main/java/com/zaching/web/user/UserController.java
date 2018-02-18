			
package com.zaching.web.user;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.User;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;

	// setter Method ���� ����

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	// �̸��� ����
	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	public String emailAuth(HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/user/emailAuth : POST");

		String email = request.getParameter("email");
		String authNum = "";// ���� ������ȣ

		authNum = RandomNum();

		User getSessionUser = (User) session.getAttribute("user");

		System.out.println("getSessionUser :: " + getSessionUser);

		System.out.println("�޴»�� email ����==>" + email);
		System.out.println("���λ����� ������ȣ==> " + authNum);

		getSessionUser.setAuthNum(authNum);
		userService.sendMail(email, authNum);

		System.out.println("DB������ȣ ===> " + getSessionUser.getAuthNum());

		session.setAttribute("user", getSessionUser);

		System.out.println("setSessionUser :: " + getSessionUser);

		return "forward:/user/emailAuth.jsp";
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

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("/user/login : POST");

		System.out.println("::" + user);

		User dbUser = userService.login(user.getEmail());
		System.out.println("::::: " + dbUser);

		if (user.getPassword().equals(dbUser.getPassword()) && user.getEmail().equals(dbUser.getEmail())) {
			session.setAttribute("user", dbUser);
			//세션에 저장하는 시간(=로그인시간 기록남기기) DB에 저장 OR 업데이트
		}
		if (session.getAttribute("user") == null) {
					
		}
		System.out.println("=====>  " + session.getAttribute("user"));
		
		System.out.println("��===>" + user.getEmail() + " = " + dbUser.getEmail());
		System.out.println("��===>" + user.getPassword() + " = " + dbUser.getPassword());
	

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		System.out.println("/user/logout : POST");
		
		
		session.invalidate();

		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception {

		System.out.println("/user/findPassword : GET");

		return "redirect:/user/findPassword.jsp";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/getUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}

	@RequestMapping(value = "getTimeLine", method = RequestMethod.GET)
	public String getTimeLine(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/getTimeLine : GET");
		// Business Logic
		User user = userService.getUser(userId);
		
		newsfeedService.timeline(userId);
		System.out.println("===>");
		
		System.out.println("뀨규뀨===>"+userId);
		// Model �� View ����
		model.addAttribute("user", user);
		

		return "forward:/user/getTimeLine.jsp";
	}

	@RequestMapping(value="updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);

		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, 
			Model model, HttpSession session) throws Exception {

		System.out.println("/user/updateUser : POST");
		// Business Logic
		user.setRole("2");
		userService.updateUser(user);
		
		System.out.println("update user ====>"+user);

		return "redirect:/user/getUser?userId=" + user.getUserId();
	}

	@RequestMapping(value = "listUser")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String, Object> map = userService.listUser(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUser.jsp";
	}

	@RequestMapping(value="memoryMap", method= RequestMethod.GET)
	public String memoryMap( HttpSession session)throws Exception{

		System.out.println("/user/memoryMap : GET");
		
		
	return "forward:/user/memoryMap.jsp";
	}
	
	@RequestMapping(value="deleteUser", method=RequestMethod.GET)
	public String deleteUser(@RequestParam("userId") int userId, 
			Model model)throws Exception{
		
		System.out.println("/user/deleteUser : GET");
		
		User user=userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return"forward:/user/deleteUser.jsp";
	}
	
}

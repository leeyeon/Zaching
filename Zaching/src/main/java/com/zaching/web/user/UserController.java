
package com.zaching.web.user;


import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired

	@Qualifier("userServiceImpl")
	private UserService userService;

	// setter Method 구현 않음

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception {

		System.out.println("/user/findPassword : GET");

		return "redirect:/user/findPassword.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {

		System.out.println("/user/addUser : GET");

		return "redirect:/user/addUser.jsp";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception {

		System.out.println("/user/addUser : POST");
		// Business Logic
		userService.addUser(user);

		return "redirect:/user/login.jsp";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/getUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/getUser.jsp";
	}

	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	public String emailAuth(HttpServletRequest request,
							HttpServletResponse response) throws Exception {

		System.out.println("/user/emailAuth : POST");
		
		String email=request.getParameter("email");
		String authNum="";
		
		authNum=RandomNum();
		
		System.out.println("받는사람 email 정보==>"+email);
		sendMail(email, authNum);

		return "forward:/user/emailAuth.jsp";
	}
	
	
	//난수발생 메소드
	public String RandomNum() {
		
		StringBuffer buffer= new StringBuffer();
		for (int i = 0; i <=6; i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
	//이메일 발송 메소드
	private void sendMail(String email, String authNum) {
		
		String host ="smtp.gmail.com";//smtp서버
		String subject="자췽ing 인증번호 전송";
		String fromName="자췽 관리자";
		String from="hi3pig@gmail.com";//관리자 메일 주소
		String to = email;//인증번호 받을 유저의이메일
		
		String content="인증번호["+authNum+"]";
		
		try {
			
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class",
						"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("hi3pig@gmail.com", "1379dlek");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress [] address1 = {new InternetAddress(to)};
			msg.setRecipients(Message.RecipientType.TO, address1);//받는사람
			msg.setSubject(subject);//메일제목
			msg.setSentDate(new Date());//보내는 날짜
			msg.setContent(content,"text/html;charset=euc-kr");//내용 설정(HTML형식)
			
			Transport.send(msg);//메일보내기
		}catch (MessagingException e) {
			e.printStackTrace();
	
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

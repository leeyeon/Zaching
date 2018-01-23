package com.zaching.web.user;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/*")
public class MailController {
	
	

	@RequestMapping(value="mailSender", method=RequestMethod.GET)
	public void mailSender(HttpServletRequest request, ModelMap mp)throws AddressException,MessagingException{
		
		// ���̹��� ��� smtp.naver.com �� �Է��մϴ�. 
		// Google�� ��� smtp.gmail.com �� �Է��մϴ�. 
		String host = "smtp.naver.com"; 
		final String username = "qudtls2026"; //���̹� ���̵� �Է����ּ���. @nave.com�� �Է����� ���ñ���. 
		final String password = "wjddms12!!"; //���̹� �̸��� ��й�ȣ�� �Է����ּ���. 
		int port=465; //��Ʈ��ȣ // ���� ���� 
		String recipient = "hi3pig@gmail.com"; //�޴� ����� �����ּҸ� �Է����ּ���. 
		String subject = "�����׽�Ʈ"; //���� ���� �Է����ּ���. 
		String body = username+"������ ���� ������ �޾ҽ��ϴ�."; //���� ���� �Է����ּ���. 
		Properties props = System.getProperties(); // ������ ��� ���� ��ü ���� 
		
		// SMTP ���� ���� ���� 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session ���� 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
		{ 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
		}); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage ����
		mimeMessage.setFrom(new InternetAddress("qudtls2026@naver.com")); //�߽��� ���� , ������ ����� �̸����ּҸ� �ѹ� �� �Է��մϴ�. �̶��� �̸��� Ǯ �ּҸ� �� �ۼ����ּ���.
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //�����ڼ��� //.TO �ܿ� .CC(����) .BCC(��������) �� ���� 
		mimeMessage.setSubject(subject); //������� 
		mimeMessage.setText(body); //������� 
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿�

		
		
		
	}

}

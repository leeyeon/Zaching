package com.zaching.service.user.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserDao;
import com.zaching.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	// Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/// Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addUser(User user) throws Exception {
			userDao.addUser(user);
	}
	

	@Override
	public User login(String email) throws Exception {
		
		return userDao.login(email);
	}

	

	@Override
	public User getTimeLine(int userId) throws Exception {
		
		return userDao.getTimeLine(userId);
	}


	@Override
	public User getUser(int userId) throws Exception {
		System.out.println("ServiceImpl ::getUser " +userId);
		return userDao.getUser(userId);
	}
	

	@Override
	public User getAccountUser(int userId) throws Exception {
		
		return userDao.getAccountUser(userId);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		List<User> list= userDao.listUser(search);
		int totalCount = userDao.getTotalCount(search); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> memoryMap(Search search) throws Exception {
		//List<Newsfeed> list =news 뉴스피드에서 카테고리구분으로 받아오기
		List<User> list = userDao.memoryMap(search);
		int totalCount =userDao.getTotalCount(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateUser(User user) throws Exception {
	
		userDao.updateUser(user);
	}

	@Override
	public void findPassword(String password) throws Exception {
		
		
		userDao.findPassword(password);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		
		userDao.updateUser(user);

	}

	@Override
	public void updateNotice(User user) throws Exception {
		
		userDao.updateNotice(user);
	}
	
	
	public boolean checkDuplication(String email) throws Exception {
		boolean result=true;
		User user=userDao.login(email);
		if(user != null) {
			result=false; //중복
		}
		return result;
	}
	
	// 이메일 발송 메소드
	public void sendMail(String email, String authNum)throws Exception {

			String host = "smtp.gmail.com";// smtp서버
			String subject = "자췽ing 인증번호 전송";
			String fromName = "자췽 관리자";
			String from = "hi3pig@gmail.com";// 관리자 메일 주소
			String to = email;// 인증번호 받을 유저의이메일

			String content = "인증번호[" + authNum + "]";
			// 인증번호를 우리 DB에 저장?해서 비교???

			try {

				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port", "465");// 이것은 무엇인가 왜 465 포트일까
				props.put("mail.smtp.user", from);
				props.put("mail.smtp.auth", "true");

				Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("hi3pig@gmail.com", "1379dlek");
					}
				});
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

				InternetAddress[] address1 = { new InternetAddress(to) };
				msg.setRecipients(Message.RecipientType.TO, address1);// 받는사람
				msg.setSubject(subject);// 메일제목
				msg.setSentDate(new Date());// 보내는 날짜
				msg.setContent(content, "text/html;charset=euc-kr");// 내용 설정(HTML형식)

				Transport.send(msg);// 메일보내기
				
			} catch (MessagingException e) {
				e.printStackTrace();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	



}

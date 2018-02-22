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
import com.zaching.service.domain.Newsfeed;
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
		
		System.out.println("");
			userDao.addUser(user);
	}
	

	@Override
	public User login(String email) throws Exception {
		System.out.println(":: userServiceImpl login::");
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
	public List<Newsfeed> memoryMap(int userId) throws Exception {
		System.out.println("UserServiceImpl/memoryMap");
		return userDao.memoryMap(userId);
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
	
	
	
	// �̸��� �߼� �޼ҵ�
	public void sendMail(String email, String authNum)throws Exception {

			String host = "smtp.gmail.com";// smtp����
			String subject = "����ing ������ȣ ����";
			String fromName = "���� ������";
			String from = "hi3pig@gmail.com";// ������ ���� �ּ�
			String to = email;// ������ȣ ���� �������̸���

			String content = "������ȣ[" + authNum + "]";
			// ������ȣ�� �츮 DB�� ����?�ؼ� ��???

			try {

				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port", "465");// �̰��� �����ΰ� �� 465 ��Ʈ�ϱ�
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
				msg.setRecipients(Message.RecipientType.TO, address1);// �޴»��
				msg.setSubject(subject);// ��������
				msg.setSentDate(new Date());// ������ ��¥
				msg.setContent(content, "text/html;charset=euc-kr");// ���� ����(HTML����)

				Transport.send(msg);// ���Ϻ�����
				
			} catch (MessagingException e) {
				e.printStackTrace();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	@Override
	public int updateRole(User user) throws Exception {
		System.out.println(":: updateRole:: ");
		return userDao.updateRole(user);		
	}

	@Override
	public void updateUser(User user) throws Exception {
	
		userDao.updateUser(user);
	}


	public boolean checkSignup(String email) throws Exception {
		
		System.out.println("::checkSignup Service::" +email);
		
		int check=userDao.checkSignup(email);
		boolean result= false;
		
		if(check == 0) {
		
			result = true; //��밡��
		}else {
			result =false; //�̸��� �ߺ� ==���Ұ���
		}
		
		System.out.println("=====> "+result);
		return result;
	}
	
	
	@Override
	public boolean snsCheck(String email, String snsType) throws Exception {
		
		System.out.println(":: UserServiceImpl snsCheck ::");
		
		int check = userDao.snsCheck(email, snsType);
		boolean result = false;
		
		if(check == 0) {//ȸ������ó��
			System.out.println("check1 :"+check);
			result = true;
		}else {//�α���ó��
			System.out.println("check2 :"+check);
			result =false;
		}
		
		System.out.println("true=ȸ������, false=�α���====>"+result);
		return result;
		
	}

	@Override
	public String updateGetAccountToken(String token, int userId) throws Exception {
		if(token != null) {
			userDao.updateAccountToken(token, userId);
		}
		return userDao.getAccountToken(userId);
	}

	@Override
	public void snsAddUser(User user) throws Exception {
		
		userDao.snsAddUser(user);
	}
	
	
	
	@Override
	public void latestLogin(int userId) throws Exception {
		//���������� ��ϳ����
		System.out.println(":: UserServiceImpl/latestLogin ::");
		userDao.latestLogin(userId);
	}

	@Override
	public void setFCMToken(int userId, String fcmToken) throws Exception {
		String currentToken = userDao.getFCMToken(userId);
		if(currentToken == null || currentToken.equals("") || !currentToken.equals(fcmToken)) {
			userDao.updateFCMToken(userId, fcmToken);
		}
	}
	
	@Override
	public String getFCMToken(int userId) throws Exception {
		String currentToken = userDao.getFCMToken(userId);
		if(currentToken == null || currentToken.equals("")) {
			return null;
		}
		return currentToken;
	}

}

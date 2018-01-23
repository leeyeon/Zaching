package com.zaching.service.user.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    } 


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
	public User getUser(int userId) throws Exception {
		
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
		return null;
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

	@Override
	public boolean sendMail(String subject, String text, String from, String to, String filePath) {

			
		// javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            // 첨부 파일 처리
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
	



}

package com.zaching.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void updateUserProfile(User user)throws Exception{
		sqlSession.update("UserMapper.updateUserProfile", user);
	}
	
	
	@Override
	public User login(String email) throws Exception {
		System.out.println("::UserDao login::\n"+email);
		
		
		return sqlSession.selectOne("UserMapper.login", email);
		
	}

	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
		
	}
	

	@Override
	public User getTimeLine(int userId) throws Exception {
		
		return sqlSession.selectOne("UserMapper.getTimeLine", userId);
	}

	@Override
	public User getUser(int userId) throws Exception {
		System.out.println("DaoImpl ::getUser" +userId);
		return sqlSession.selectOne("UserMapper.getUser",userId);
	}
	
	@Override
	public List<User> listUser(Search search) throws Exception {
		
		return sqlSession.selectList("UserMapper.listUser", search);
	}

	@Override
	public void updateUser(User user) throws Exception {
		System.out.println("::[before] UserDaoImpl UpdateUser ::"+user);
		sqlSession.update("UserMapper.updateUser", user);
		System.out.println("::[After] UserDaoImpl UpdateUser ::"+user);
		
	}

	@Override
	public int updateRole(User user) throws Exception {
		
		System.out.println("::UserDao updateRole::\n"+user);
	
		return	sqlSession.update("UserMapper.updateRole", user);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public User getAccountUser(int userId) throws Exception {
		
		return sqlSession.selectOne("UserMapper.getAccountUser", userId);
	}

	@Override
	public void updateNotice(User user) throws Exception {
		sqlSession.update("UserMapper.updateNotice", user);
		
	}

	@Override
	public String findPassword(String email){
		
		//inputtext 값가져와서 "@"빼고 문자열 일치하는지 비교하고 메일전송
		return sqlSession.selectOne("UserMapper.findPassword", email);
		
	}

	@Override
	public List<Newsfeed> memoryMap(int userId) throws Exception {
		
		return sqlSession.selectList("UserMapper.memoryMap", userId);
	}


	@Override
	public int checkSignup(String email) throws Exception {
		System.out.println(":: checkSignup :: DaoImpl");
		
		
		return sqlSession.selectOne("UserMapper.checkSignup", email);
	}
	
	@Override
	public void updateAccountToken(String token, int userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("token", token);
		map.put("userId", userId);
		
		sqlSession.update("UserMapper.updateAccountToken", map);
	}
	
	@Override
	public String getAccountToken(int userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getAccountToken", userId);
	}
	
	public String getPWD(String id) throws Exception{
		return sqlSession.selectOne("UserMapper.getPassword", id);
	}

	@Override
	public void snsAddUser(User user) throws Exception {
		
		sqlSession.insert("UserMapper.snsAddUser", user);
	}

	@Override
	public int snsCheck(String email, String snsType) throws Exception {
		System.out.println("전달받은값 :"+email+" , "+snsType);
		
		return sqlSession.selectOne("UserMapper.snsCheck", email);
	}
	
	@Override
	public String getFCMToken(int userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getFCMToken", userId);
	}
	
	@Override
	public void updateFCMToken(int userId, String fcmToken) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("fcmToken", fcmToken);
		sqlSession.selectOne("UserMapper.updateFCMToken", map);
	}

	@Override
	public void latestLogin(int userId) throws Exception {
		System.out.println(":: UserDaoImpl/latestLogin/ :: "+userId);
		sqlSession.update("UserMapper.updateLatestDate", userId);
		
	}
	
	
	
}

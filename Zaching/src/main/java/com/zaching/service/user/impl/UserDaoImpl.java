package com.zaching.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
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
	public User login(String email) throws Exception {
		
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
		
		sqlSession.update("UserMapper.updateUser", user);
		
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
	public List<User> memoryMap(Search search) throws Exception {
		
		return sqlSession.selectList("UserMapper.memoryMap", search);
	}

	@Override
	public void emailAuth(User user) throws Exception {
		sqlSession.update("UserMapper.emailAuth", user);
		
	}

	

}

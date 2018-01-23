package com.zaching.service.user.impl;

import java.util.List;

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
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
		
	}

	@Override
	public User getUser(int userId) throws Exception {
		
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
		
		//inputtext �������ͼ� "@"���� ���ڿ� ��ġ�ϴ��� ���ϰ� ��������
		return sqlSession.selectOne("UserMapper.findPassword", email);
		
	}

}
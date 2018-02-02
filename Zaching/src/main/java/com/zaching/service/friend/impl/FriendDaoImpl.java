package com.zaching.service.friend.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Friend;
import com.zaching.service.friend.FriendDao;

@Repository("friendDaoImpl")
public class FriendDaoImpl implements FriendDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void  serSqlSession(SqlSession sqlSession) {
		
		this.sqlSession=sqlSession;
	}
	
	public FriendDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Friend updateFriend(Friend status) throws Exception {
		 sqlSession.update("FriendMapper.updateFriend", status);
		return null;
		}

	@Override
	public Friend getFriend(int friendId) throws Exception {
		return sqlSession.selectOne("FriendMapper.getFriend",friendId);
	}

	@Override
	public void addFriend(Friend friend) throws Exception {
		sqlSession.insert("FriendMapper.addFriend",friend);
	}

	@Override
	public void acceptFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void recommendFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFriend(int friendId) throws Exception {
		sqlSession.delete("FriendMapper.deleteFriend",friendId);
	}

	@Override
	public List<Friend> listFriend(Search search) throws Exception {
		return sqlSession.selectList("FriendMapper.listFriend",search);
	}

	@Override
	public boolean blockFriend(Friend friendId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("FriendMapper.getTotalCount",search);
	}
	
	
	

}
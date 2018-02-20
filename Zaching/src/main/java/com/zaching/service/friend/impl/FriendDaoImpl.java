package com.zaching.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Friend updateFriend(Friend friend) throws Exception {
		 sqlSession.update("FriendMapper.updateFriend", friend);
		return null;
		}

	@Override
	public Friend getFriend(int friendId) throws Exception {
		return sqlSession.selectOne("FriendMapper.getFriend",friendId);
	}

	@Override
	public void addFriend(Friend friend, String status) throws Exception {
		System.out.println("Dao : "+friend);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("friend", friend);
		map.put("status", status);
		
		sqlSession.insert("FriendMapper.addFriend",map);
	}
	
	@Override
	public void enterFriend(Friend friend) {
		sqlSession.insert("FriendMapper.enterFriend",friend);
		
	}

	@Override
	public void acceptFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Friend> recommendFriend(int userId) throws Exception {
		return sqlSession.selectList("FriendMapper.recommendFriend", userId);
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

	@Override
	public int checkFriend(int userId, int friendId, int status) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		map.put("status", status);
		return sqlSession.selectOne("FriendMapper.checkFriend", map);
	}

	@Override
	public void cancelFriend(int userId, int friendId, int status) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		map.put("status", status);
		sqlSession.delete("FriendMapper.cancelFriend", map);
		
	}

	@Override
	public void updateStatus(int userId, int friendId, int status) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		map.put("status", status);
		sqlSession.update("FriendMapper.updateStatus", map);
		
	}

	@Override
	public int checkFollow(int userId, int friendId, int status) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		map.put("status", status);
		
		return sqlSession.selectOne("FriendMapper.checkFollow", map);
	}
	
	


	
	
	

}

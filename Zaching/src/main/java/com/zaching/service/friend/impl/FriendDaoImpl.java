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
public class FriendDaoImpl implements FriendDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {

		this.sqlSession = sqlSession;

	}

	public FriendDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addFriend(Friend friend) throws Exception {
		sqlSession.insert("FriendMapper.addFriend", friend);
	}

	@Override
	public void acceptFriend(Friend friend) throws Exception {
		sqlSession.insert("FriendMapper.acceptFriend", friend);

	}

	@Override
	public void recommendFriend(Friend friend) throws Exception {
		sqlSession.insert("FriendMapper.recommnedFriend", friend);
	}

	@Override
	public List<Friend> listFriend(Search search) throws Exception {
		return sqlSession.selectList("FriendMapper.lisrFriend", search);
	}

	@Override
	public boolean blockFriend(Friend friendId) throws Exception {

		return false;

	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("FriendMapper.getTotalcount", search);
	}

	@Override
	public void deleteFriend(Friend friend) throws Exception {
		sqlSession.delete("FriendMapper.deleteFriend",friend);
	}

}

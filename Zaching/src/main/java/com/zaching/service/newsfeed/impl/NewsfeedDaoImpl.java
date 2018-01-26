package com.zaching.service.newsfeed.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedDao;

@Repository("newsfeedDaoImpl")
public class NewsfeedDaoImpl implements NewsfeedDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addNewsfeed(Newsfeed newsfeed) throws Exception {
		sqlSession.insert("NewsfeedMapper.addNewsfeed", newsfeed);
		
	}

	@Override
	public void deleteNewsfeed(int newsfeedID) throws Exception {
		sqlSession.delete("NewsfeedMapper.deleteNewsfeed", newsfeedID);
		
	}

	@Override
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception {
		sqlSession.update("NewsfeedMapper.updateNewsfeed", newsfeed);
	}

	@Override
	public Newsfeed getNewsfeed(int newsfeedID) throws Exception {
		return (Newsfeed)sqlSession.selectOne("NewsfeedMapper.getNewsfeed", newsfeedID);
		
	}

	@Override
	public List<Newsfeed> listNewsfeed(Search search) throws Exception {
		return sqlSession.selectList("NewsfeedMapper.getNewsfeedList", search);
	}

	@Override
	public int getCountLike(int newsfeedID) throws Exception {
		return sqlSession.selectOne("NewsfeedMapper.getCountLike", newsfeedID);
	}
	
	@Override
	public int getCountReply(int newsfeedID) throws Exception{
		return sqlSession.selectOne("NewsfeedMapper.getCountReply", newsfeedID);
	}

	@Override
	public  void updateCountLike(int newsfeedID) throws Exception {
		sqlSession.update("NewsfeedMapper.updateCountLike", newsfeedID);
	}

	@Override
	public void updateCountReply(int newsfeedID) throws Exception {
		sqlSession.update("NewsfeedMapper.updateCountReply", newsfeedID);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception{
		return sqlSession.selectOne("NewsfeedMapper.getTotalCount", search);
	}

	@Override
	public List<Newsfeed> listNewsfeeds(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NewsfeedMapper.getNewsfeedLists", search);
	}

	@Override
	public void addLikeBlind(int newsfeedId, int userId, String status) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("newsfeedId", newsfeedId);
		map.put("userId", userId);
		map.put("status", status);
		sqlSession.insert("NewsfeedMapper.addLikeBlind", map);
	}

}

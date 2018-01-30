package com.zaching.service.newsfeed.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedDao;
import com.zaching.service.newsfeed.NewsfeedService;

@Service("newsfeedServiceImpl")
public class NewsfeedServiceImpl implements NewsfeedService{
	@Autowired
	@Qualifier("newsfeedDaoImpl")
	NewsfeedDao newsfeedDao;
	public void setNewsfeedDao(NewsfeedDao newsfeedDao) {
		this.newsfeedDao = newsfeedDao;
	}
	
	@Override
	public void addNewsfeed(Newsfeed newsfeed) throws Exception {
		newsfeedDao.addNewsfeed(newsfeed);
		
	}

	@Override
	public void deleteNewsfeed(int newsfeedId) throws Exception {
		newsfeedDao.deleteNewsfeed(newsfeedId);
		
	}

	@Override
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception {
		newsfeedDao.updateNewsfeed(newsfeed);
		
	}

	@Override
	public void getNewsfeed(int newsfeedId) throws Exception {
		newsfeedDao.getNewsfeed(newsfeedId);
		
	}

	@Override
	public Map<String, Object> listNewsfeed(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Newsfeed> list = newsfeedDao.listNewsfeed(search);
		int count = newsfeedDao.getTotalCount(search);
		
		map.put("list", list);
		map.put("count", count);
		return map;
	}

	@Override
	public int getCountLike(int newsfeedId) throws Exception {
		return newsfeedDao.getCountLike(newsfeedId);
	}

	@Override
	public int getCountReply(int newsfeedId) throws Exception {
		return newsfeedDao.getCountReply(newsfeedId);
	}

	@Override
	public void updateCountLike(int newsfeedId) throws Exception {
		newsfeedDao.updateCountLike(newsfeedId);
	}

	@Override
	public void updateCountReply(int newsfeedId) throws Exception {
		newsfeedDao.updateCountReply(newsfeedId);
	}
	
	public Map<String, Object> listTimeLine(Search search) throws Exception{
		return null;
	}

	@Override
	public List<Newsfeed> listNewsfeeds(Search search) throws Exception {
		// TODO Auto-generated method stub
		return newsfeedDao.listNewsfeeds(search);
	}

	@Override
	public void addLikeBlind(int newsfeedId, int userId, String status) throws Exception {
		newsfeedDao.addLikeBlind(newsfeedId, userId, status);
		
	}
	
	
	
}

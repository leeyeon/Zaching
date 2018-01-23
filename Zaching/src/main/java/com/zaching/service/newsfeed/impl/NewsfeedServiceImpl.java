package com.zaching.service.newsfeed.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedDao;
import com.zaching.service.newsfeed.NewsfeedService;

@Repository("newsfeedServiceImpl")
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
	public void deleteNewsfeed(int newsfeedID) throws Exception {
		newsfeedDao.deleteNewsfeed(newsfeedID);
		
	}

	@Override
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception {
		newsfeedDao.updateNewsfeed(newsfeed);
		
	}

	@Override
	public void getNewsfeed(int newsfeedID) throws Exception {
		newsfeedDao.getNewsfeed(newsfeedID);
		
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
	public int getCountLike(int newsfeedID) throws Exception {
		return newsfeedDao.getCountLike(newsfeedID);
	}

	@Override
	public int getCountReply(int newsfeedID) throws Exception {
		return newsfeedDao.getCountReply(newsfeedID);
	}

	@Override
	public void updateCountLike(int newsfeedID) throws Exception {
		newsfeedDao.updateCountLike(newsfeedID);
	}

	@Override
	public void updateCountReply(int newsfeedID) throws Exception {
		newsfeedDao.updateCountReply(newsfeedID);
	}
	
	
	
}

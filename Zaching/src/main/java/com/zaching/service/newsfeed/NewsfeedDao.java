package com.zaching.service.newsfeed;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;

public interface NewsfeedDao {
public void addNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void deleteNewsfeed(int newsfeedID) throws Exception;
	
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void getNewsfeed(int newsfeedID) throws Exception;
	
	public Map<String, Object> listNewsfeed(Search search) throws Exception;
	
	public int getCountLike(int newsfeedID) throws Exception; 
}

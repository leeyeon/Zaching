package com.zaching.service.newsfeed;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;

public interface NewsfeedDao {
public void addNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void deleteNewsfeed(int newsfeedID) throws Exception;
	
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public Newsfeed getNewsfeed(int newsfeedID) throws Exception;
	
	public List<Newsfeed> listNewsfeed(Search search) throws Exception;
	
	public int getCountLike(int newsfeedID) throws Exception;
	
	public int getCountReply(int newsfeedID) throws Exception;
	
	public void updateCountLike(int newsfeedID) throws Exception;
	
	public void updateCountReply(int newsfeedID) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}

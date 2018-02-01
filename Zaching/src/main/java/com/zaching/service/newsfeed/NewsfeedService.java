package com.zaching.service.newsfeed;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;

public interface NewsfeedService {
	public void addNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void deleteNewsfeed(int newsfeedId) throws Exception;
	
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public Newsfeed getNewsfeed(int newsfeedId) throws Exception;
	
	public Map<String, Object> listNewsfeed(Search search) throws Exception;
	
	public int getCountLike(int newsfeedId) throws Exception;
	
	public int getCountReply(int newsfeedId) throws Exception;
	
	public void updateCountLike(int newsfeedId) throws Exception;
	
	public void updateCountReply(int newsfeedId) throws Exception;
	
	public List<Newsfeed> listNewsfeeds(Search search) throws Exception;
	
	public void addLikeBlind(int newsfeedId, int userId, String status) throws Exception;
}

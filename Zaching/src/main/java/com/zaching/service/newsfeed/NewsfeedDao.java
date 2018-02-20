package com.zaching.service.newsfeed;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;

public interface NewsfeedDao {
public void addNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void deleteNewsfeed(int newsfeedId) throws Exception;
	
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public Newsfeed getNewsfeed(int newsfeedId) throws Exception;
	
	public List<Newsfeed> listNewsfeed(Search search) throws Exception;
	
	public int getCountLike(int newsfeedId) throws Exception;
	
	public int getCountReply(int newsfeedId) throws Exception;
	
	public void updateCountLike(int newsfeedId) throws Exception;
	
	public void updateCountReply(int newsfeedId) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public List<Newsfeed> listNewsfeeds(Search search) throws Exception;
	
	public void addLikeBlind(int newsfeedId, int userId, String status) throws Exception;
	
	public void deleteLikeBlind(int newsfeedId, int userId, String status) throws Exception;
	
	public void cancelCountLike(int newsfeedId) throws Exception;
	
	public int getLikeUser(int newsfeedId, int userId, String status) throws Exception;
	
	public List<Newsfeed> timeline(int userId) throws Exception;
	
	public List<Newsfeed> listMemoryMap(int userId) throws Exception;
}

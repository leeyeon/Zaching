package com.zaching.service.newsfeed;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Newsfeed;

public interface NewsfeedService {
	public void addNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void deleteNewsfeed(int newsfeedID) throws Exception;
	
	public void updateNewsfeed(Newsfeed newsfeed) throws Exception;
	
	public void getNewsfeed(int newsfeedID) throws Exception;
	
	public List<Newsfeed> listNewsfeed(Search search) throws Exception;
}

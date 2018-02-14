package com.zaching.service.broadcast;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Broadcast;

public interface BroadcastService {
	
	public void addBroadcast(Broadcast broadcast) throws Exception;
	
	public Map<String, Object>listBroadcast(Search search) throws Exception;
	
	public void deleteBroadcast(int userId) throws Exception;
	
	
}

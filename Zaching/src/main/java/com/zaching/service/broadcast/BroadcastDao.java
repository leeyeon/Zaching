package com.zaching.service.broadcast;

import java.util.List;

import org.json.simple.JSONObject;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Broadcast;

public interface BroadcastDao {

	public void addBroadcast(Broadcast broadcast) throws Exception;
	
	public List<JSONObject> listBroadcast(Search search) throws Exception;
	
	public long getTotalCount(Search search) throws Exception;
}

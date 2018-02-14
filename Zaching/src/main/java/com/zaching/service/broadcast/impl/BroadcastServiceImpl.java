package com.zaching.service.broadcast.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.broadcast.BroadcastDao;
import com.zaching.service.broadcast.BroadcastService;
import com.zaching.service.domain.Broadcast;

@Repository("broadcastServiceImpl")
public class BroadcastServiceImpl implements BroadcastService {
	
	@Autowired
	@Qualifier("broadcastDaoImpl")
	BroadcastDao broadcastDao;

	public void setVoiceDao(BroadcastDao broadcastDao) {
		this.broadcastDao = broadcastDao;
	}

	public BroadcastServiceImpl() {
		System.out.println(":: "+getClass()+" default Constructor Call.......");
	}

	@Override
	public void addBroadcast(Broadcast broadcast) throws Exception {
		// TODO Auto-generated method stub		
		
		System.out.println("BroadcastServerImpl 입니다.");
		broadcastDao.addBroadcast(broadcast);
	}

	@Override
	public Map<String, Object> listBroadcast(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JSONObject> list = broadcastDao.listBroadcast(search);
		int count = (int)broadcastDao.getTotalCount(search);
		//total count update 해야함 .
		System.out.println("count::"+ count );
		map.put("list", list);
		map.put("totalCount",count);
		return map;
	}

	@Override
	public void deleteBroadcast(int userId) throws Exception {
		// TODO Auto-generated method stub
		
	}


}


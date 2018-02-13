package com.zaching.service.broadcast.impl;

import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.zaching.service.broadcast.BroadcastDao;
import com.zaching.service.domain.Broadcast;


@Repository("broadcastDaoImpl")
public class BroadcastDaoImpl implements BroadcastDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(":: "+getClass()+" setSqlSession() Call.......");
		this.sqlSession = sqlSession;
	}

	public BroadcastDaoImpl() {
		System.out.println(":: "+getClass()+" default Constructor Call.......");
	}

	@Override
	public void addBroadcast(Broadcast broadcast) throws Exception {
		// TODO Auto-generated method stub		
		
		System.out.println("addBroadcastDaoImpl 입니다.");
		MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/broadcast"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");
		
		DBCollection dbcoll = db.getCollection("broads");
		
		Calendar calendar = Calendar.getInstance();
        Date year = calendar.getTime();
		
		//쓰기권한 부여 
		WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
        mongoClient.setWriteConcern(w);
        
        BasicDBObject addObject = new BasicDBObject();
 
        //addObject.put("broadcasterId",broadcast.getBroadcaster().getUserId());        
        addObject.put("broadcastId",broadcast.getUserId());
        addObject.put("broadcaster",broadcast.getUserName());
        addObject.put("profileImage",broadcast.getProfileImage());
        addObject.put("title",broadcast.getTitle());
        addObject.put("detail",broadcast.getDetail());        
        addObject.put("image",broadcast.getFileName());
        addObject.put("forbidden",broadcast.getForbidden());
        addObject.put("date", year);
        //System.out.println("ㅎㅇㅇ"+addObject);
        System.out.println("몽고db저장.");
        dbcoll.insert(addObject);
        mongoClient.close();       
	}


}


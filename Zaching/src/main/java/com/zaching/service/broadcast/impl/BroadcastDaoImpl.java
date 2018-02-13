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
		
		System.out.println("addBroadcastDaoImpl �Դϴ�.");
		MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/broadcast"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");
		
		DBCollection dbcoll = db.getCollection("broads");
		
		Calendar calendar = Calendar.getInstance();
        Date year = calendar.getTime();
		
		//������� �ο� 
		WriteConcern w = new WriteConcern(1,2000);//���� �� ����, ���� �ð� 2000 //������ ���ԵǸ� 2�� ���ÿ� �� ��쵵 ����ϱ�
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
        //System.out.println("������"+addObject);
        System.out.println("����db����.");
        dbcoll.insert(addObject);
        mongoClient.close();       
	}


}


package com.zaching.service.broadcast.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.zaching.common.domain.Search;
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

	@Override
	public List<JSONObject> listBroadcast(Search search) throws Exception {
		
		List<String> list = new ArrayList<String>();	
		List<JSONObject> list2 = new ArrayList<JSONObject>();
		
		try {
			
			MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/broadcast"); 
	        MongoClient mongoClient = new MongoClient(uri);
	        DB db = mongoClient.getDB(uri.getDatabase());
			System.out.println("MONGODB SUCCESS");
			
			DBCollection dbcoll = db.getCollection("broads");
			
			//쓰기권한 부여 
			WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
	        mongoClient.setWriteConcern(w);
	        
	        DBCursor cursor = dbcoll.find().skip(search.getStartRowNum()-1).limit(search.getEndRowNum()-1);
	        while(cursor.hasNext()){
	            //커서의 이름 내용 전체 출력 
	        	
	            //System.out.println(cursor.next());   
	            list.add(""+cursor.next());
	        }
	        
	        JSONParser parser = new JSONParser();
	        JSONObject obj = new JSONObject();
	        
	        
	        
	        for(String str:list) {
		        obj = (JSONObject)parser.parse(str);
		        
		        System.out.println("오비제이 값 : "+obj);
		        //System.out.println(((JSONObject)obj.get("date")).get("$date"));
		        list2.add(obj);
	        }
	        
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list2;
	}
	@Override
	public long getTotalCount(Search search) throws Exception {
		
		MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/broadcast"); 
        MongoClient mongoClient = new MongoClient(uri);
        DB db = mongoClient.getDB(uri.getDatabase());
		System.out.println("MONGODB SUCCESS");
		
		DBCollection dbcoll = db.getCollection("broads");
		long dbsize = dbcoll.count();
		return dbsize;
	}

}


package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.URLConnection;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Notice;

/*
 * 작성자 : 이연희
 * */

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao {
	
	public final static String AUTH_KEY_FCM = "AAAAlbj42Ik:APA91bGpI_jpccs4ISydOHxl0ODYLKlYPM5JVigh-oTI2wPgNgLrx7lKRhgFI2Bvc5uD5y1CaehAxDRCifH2MMNSV1aazGeLcQMQiIjhy66AT3b8FE4lAK53RkxXuKQGFa9-0Xgm1HdG";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	

	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void noticeUpdate(int noticeId) throws Exception{
		sqlSession.update("NoticeMapper.updateNotice", noticeId);
	}
	
	@Override
	public List<Notice> listNotice(Search search, int userId) throws Exception{
	
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		
		return sqlSession.selectList("NoticeMapper.listNotice", map);

	}
	
	@Override
	public int getNoticeTotalCount(Search search, int userId) throws Exception{
				
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("search", search);
		

		return sqlSession.selectOne("NoticeMapper.getNoticeTotalCount", map);
	}
	
	@Override
	public Notice addNotice(Notice notice) throws Exception{
		sqlSession.insert("NoticeMapper.addNotice", notice);
		return notice;
	}
	
	@Override
	public void sendAndroid(List<String> tokenList, Notice notice) throws Exception {
		
		//https://firebase.google.com/docs/cloud-messaging/http-server-ref?hl=ko
		
		JSONObject root = new JSONObject();
		JSONObject notification = new JSONObject();
		notification.put("title", "알려드립니다.");
		notification.put("body", notice.getContent());
		
		JSONObject data = new JSONObject();
		data.put("cateogry", notice.getCategory());
		
		JSONArray array = new JSONArray();
		
		for (String string : tokenList) {
			if(string != null) {
				array.add(string);
			}
		}
		
		root.put("registration_ids", array);
		root.put("notification", notification);
		root.put("click_action", "OPEN_ACTIVITY");
		
		System.out.println(root.toJSONString());
		
		JSONObject obj = URLConnection.getJSON_PARAM("POST", API_URL_FCM, root.toJSONString(), "application/json",
				"Authorization", "key="+AUTH_KEY_FCM);

	}
	
	@Override
	public void addNoticeTarget(Notice notice) throws Exception{
		sqlSession.insert("NoticeMapper.addNoticeTarget", notice);
	}


	@Override
	public Comment addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
		
		return comment;
	}
	
	@Override
	public Comment getComment(int commentId) throws Exception {
		return sqlSession.selectOne("CommentMapper.getComment", commentId);
	}

	@Override
	public void deleteComment(int commentId) throws Exception {
		sqlSession.update("CommentMapper.deleteComment", commentId);
	}

	@Override
	public List<Comment> listComment(Search search, String categoryCode, int roomId) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println(categoryCode+" // "+roomId);
		map.put("categoryCode", categoryCode);
		map.put("roomId", roomId);
		map.put("search", search);
		
		return sqlSession.selectList("CommentMapper.listComment", map);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}
	
	@Override
	public int getTotalCount(Search search, String categoryCode, int roomId) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("categoryCode", categoryCode);
		map.put("roomId", roomId);
		map.put("search", search);
		
		System.out.println("totalCount ::"+map);
		
		return sqlSession.selectOne("CommentMapper.getTotalCount", map);
	}
}

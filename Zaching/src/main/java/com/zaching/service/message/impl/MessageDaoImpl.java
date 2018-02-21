package com.zaching.service.message.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Message;
import com.zaching.service.message.MessageDao;

@Repository("messageDaoImpl")
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		
		this.sqlSession=sqlSession;
	}
	
	public MessageDaoImpl() {
	System.out.println(this.getClass());	
	
	}

	@Override
	public void addMessage(Message message) throws Exception {
		sqlSession.insert("MessageMapper.addMessage",message);
		
	}

	@Override
	public void deleteMessage(int messageId) throws Exception {
		sqlSession.delete("MessageMapper.deleteMessage",messageId);
	}

	@Override
	public List<Message> listMessage(Search search) throws Exception {
		return sqlSession.selectList("MessageMapper.listMessage",search);
	}

	@Override
	public int  getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("MessageMapper.getTotalCount",search);
	}

	@Override
	public Message getMessage(int messageId) throws Exception {
		return sqlSession.selectOne("MessageMapper.getMessage",messageId);
	}
	
	@Override
	public List<Message> listMessagebyRoomId(Search search) throws Exception {
		return sqlSession.selectList("MessageMapper.listMessagebyRoomId",search);
	}
	
	@Override
	public int checkRoom(int userId, int friendId) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("friendId", friendId);
		
		int result = sqlSession.selectOne("MessageMapper.checkRoom", map);
		
		return result;
	
	}
}

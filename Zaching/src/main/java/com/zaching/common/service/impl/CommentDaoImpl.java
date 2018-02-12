package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Notice;

/*
 * 작성자 : 이연희
 * */

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
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
	public void addNoticeTarget(Notice notice) throws Exception{
		sqlSession.insert("NoticeMapper.addNoticeTarget", notice);
	}
	

	public CommentDaoImpl() {
		System.out.println(this.getClass());
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
		
		return sqlSession.selectOne("CommentMapper.getTotalCount", map);
	}
}

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

	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Comment addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
		
		return comment;
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
}

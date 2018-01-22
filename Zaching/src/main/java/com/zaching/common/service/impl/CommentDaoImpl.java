package com.zaching.common.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import org.springframework.beans.factory.BeanCreationException;

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
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteComment(int commentId) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Comment> listComment(String categoryCode, int roomId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

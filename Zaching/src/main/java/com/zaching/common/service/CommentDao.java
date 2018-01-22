package com.zaching.common.service;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;

public interface CommentDao {

	public void addComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;
	
	/* ��ģ��, �����ǵ�, ���̽����� �� �����ϴ� categoryCode */
	public List<Comment> listComment(Search search, String categoryCode, int roomId) throws Exception;

}

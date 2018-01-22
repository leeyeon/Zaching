package com.zaching.common.service;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;

public interface CommonService {
	
	/* CommentDao »ç¿ë */
	
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception;
	
	public void addComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;

}

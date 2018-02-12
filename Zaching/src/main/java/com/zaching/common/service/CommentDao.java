package com.zaching.common.service;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Notice;

public interface CommentDao {

	public Comment addComment(Comment comment) throws Exception;
	
	public Comment getComment(int commentId) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;
	
	/* ��ģ��, �����ǵ�, ���̽����� �� �����ϴ� categoryCode */
	
	public List<Comment> listComment(Search search, String categoryCode, int roomId) throws Exception;

	public void updateComment(Comment comment) throws Exception;
	
	public int getTotalCount(Search search, String categoryCode, int roomId) throws Exception;
	
	
	
	/* �˸� */
	
	public List<Notice> listNotice(Search search, int userId) throws Exception;
	
	public int getNoticeTotalCount(Search search, int userId) throws Exception;
	
	public Notice addNotice(Notice notice) throws Exception;
	
	public void addNoticeTarget(Notice notice) throws Exception;
	
	public void noticeUpdate(int noticeId) throws Exception;
}

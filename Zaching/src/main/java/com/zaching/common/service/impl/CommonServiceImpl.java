package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;

@Service("commonServiceImpl")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	/*
	 * Comment Category Code
	 * V00 : ���̽�����,
	 * B00 : ��ģ��
	 * N00 : �����ǵ�
	 * ( ���̺� ���Ǽ� ���� )
	 */

	public CommonServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", commentDao.listComment(search, categoryCode, roomId));
		
		return map;
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
	}

	@Override
	public void deleteComment(int commentId) throws Exception {
		commentDao.deleteComment(commentId);
	}

}

package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.common.service.CommonService;
import com.zaching.common.service.FileDao;
import com.zaching.service.domain.Comment;

@Service("commonServiceImpl")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	@Autowired
	@Qualifier("fileDaoImpl")
	private FileDao fileDao;
	
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
		
		List<Comment> list = (List<Comment>)map.get("list");

		return map;
	}

	@Override
	public Comment addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
		return comment;
	}

	@Override
	public void deleteComment(int commentId) throws Exception {
		commentDao.deleteComment(commentId);
	}
	
	@Override
	public void updateComment(Comment comment) throws Exception {
		commentDao.updateComment(comment);
	}

	@Override
	public String addFile(String fileDirectory, MultipartFile uploadFile) {
		return fileDao.addFile(fileDirectory, uploadFile);
	}

}

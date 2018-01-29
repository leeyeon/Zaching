package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.common.service.CommonService;
import com.zaching.common.service.FileDao;
import com.zaching.common.service.KakaoRestDao;
import com.zaching.service.domain.Comment;

@Service("commonServiceImpl")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	/*
	 * Comment Category Code
	 * V00 : 보이스리플,
	 * B00 : 밥친구
	 * N00 : 뉴스피드
	 * ( 테이블 정의서 참조 )
	 */
	
	@Autowired
	@Qualifier("fileDaoImpl")
	private FileDao fileDao;
	
	@Autowired
	@Qualifier("kakaoRestDaoImpl")
	private KakaoRestDao kakaoRestDao;

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

	@Override
	public String getAuthorizationUrl() {
		return kakaoRestDao.getAuthorizationUrl();
	}

	@Override
	public Map<String, Object> getAceessToken(String code) throws Exception {
		return kakaoRestDao.getAceessToken(code);
	}

	@Override
	public String getPaymentReady(String token, int point) throws Exception {
		if(token == null) {
			return kakaoRestDao.getPaymentReady(point);
		} else {
			return kakaoRestDao.getPaymentReady(token, point);
		}
	}

	@Override
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception {
		if(token == null) {
			return kakaoRestDao.getPaymentApprove(pgToken);
		} else {
			return kakaoRestDao.getPaymentApprove(token, pgToken);
		}
	}

}

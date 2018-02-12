package com.zaching.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.common.service.CommentDao;
import com.zaching.common.service.CommonService;
import com.zaching.common.service.FacebookRestDao;
import com.zaching.common.service.FileDao;
import com.zaching.common.service.KakaoRestDao;
import com.zaching.service.domain.Comment;

import com.zaching.service.domain.Notice;

import com.zaching.service.domain.User;

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
	
	
	@Autowired
	@Qualifier("facebookRestDaoImpl")
	private FacebookRestDao facebookRestDao;

	public CommonServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		
		int totalCount = commentDao.getTotalCount(search, categoryCode, roomId);
		
		int pageSize = totalCount / search.getPageSize();
		System.out.println(totalCount);
		
		List<Comment> list = (List<Comment>) commentDao.listComment(search, categoryCode, roomId);
		//for (Comment comment : list) {
		//	System.out.println(comment);
		//}
		System.out.println(list);
		
		map.put("list", commentDao.listComment(search, categoryCode, roomId));
		map.put("totalCount", commentDao.getTotalCount(search, categoryCode, roomId));
		return map;
	}
	
	

	@Override
	public Comment addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
		return comment;
	}
	
	@Override
	public Comment getComment(int commentId) throws Exception {
		return commentDao.getComment(commentId);
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
	

	//로그인화면
	@Override
	public String getAuthorizationUrl_login(HttpSession session) {
		
		return kakaoRestDao.getAuthorizationUrl_login(session);
	}
	//토큰요청
	@Override
	public User getAceessToken2(String code,HttpSession session) throws Exception {
		
		return kakaoRestDao.getAceessToken2(code,session);
	}
	
	//앱연결
	@Override
	public void getAppConnection(String token) throws Exception {
		// TODO Auto-generated method stub
		kakaoRestDao.getAppConnection(token);
	}
	
	//사용자 정보 요청
	@Override
	public User getUserInfo(User user) throws Exception {
		
		return kakaoRestDao.getUserInfo(user);
	}
	
	

	@Override
	public Map<String, Object> listNotice(Search search, int userId) throws Exception {
		
		List<Notice> list= commentDao.listNotice(search, userId);
		
		int totalCount = commentDao.getNoticeTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
	}
	
	@Override
	public void addNotice(Notice notice) throws Exception{
		commentDao.addNotice(notice);
	}
	
	@Override
	public void addNoticeTarget(Notice notice) throws Exception{
		commentDao.addNoticeTarget(notice);
	}
	
	@Override
	public void noticeUpdate(int noticeId) throws Exception{
		commentDao.noticeUpdate(noticeId);
	}
	
	
	//////페이스북
	@Override
	public String getAuthorizationUrl_facebook(HttpSession session) {
		
		return facebookRestDao.getAuthorizationUrl_facebook(session);
	}

	@Override
	public String getAccessToken_facebook(HttpSession session,String code) throws Exception {
		
		return facebookRestDao.getAccesstoken(session,code);
	}

	@Override
	public void getUserProfile(String accesstoken, HttpSession session) throws Exception {
		
		facebookRestDao.getUserProfile(accesstoken, session);
	}
	
	

}

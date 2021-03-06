package com.zaching.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;

import com.zaching.service.domain.User;

import com.zaching.service.domain.Notice;


public interface CommonService {
	
	/* CommentDao 사용 */
	
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception;
	
	public Comment addComment(Comment comment) throws Exception;
	
	public Comment getComment(int commentId) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	
	
	/* FileDao 사용 
	 * fileDirectory : file이 들어갈 경로 맨 뒤에 \\ 필수 입력.
	 * (ex) C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\
	 * */
	public String addFile(String fileDirectory, MultipartFile uploadFile);
	
	// 요거 상대 경로인듯...
	
	public String addFileImage(HttpServletRequest request, MultipartFile uploadFile);
	
	/* KakaoDao 사용
	 * getAuto / getToken / kakaoPay
	 * */
	
	public String getAuthorizationUrl();
	
	public String getAuthorizationUrl_login(HttpSession session);
	
	
	
	public Map<String, Object> getAceessToken(String code) throws Exception;
	
	public User getAceessToken2(String code,HttpSession session) throws Exception;
	
	public String getPaymentReady(String token, int point) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception;
	

	public void getAppConnection(String token)throws Exception;
	
	public User getUserInfo(User user)throws Exception;

	/**********************************************/
	
	public void addNotice(Notice notice) throws Exception;
	
	public void deleteNotice(int noticeId) throws Exception;
	
	public void addNoticeTarget(Notice notice) throws Exception;
	
	public Map<String, Object> listNotice(Search search, int userId) throws Exception;
	
	public void noticeUpdate(int noticeId) throws Exception;
	
	public void sendAndroid(List<String> tokenList, Notice notice) throws Exception;

	//페이스북
	public String getAuthorizationUrl_facebook(HttpSession session);
	
	public User getAccessToken_facebook(HttpSession session,String code)throws Exception;
	
	public User getUserProfile(User user)throws Exception;
}

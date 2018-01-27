package com.zaching.common.service;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;

public interface CommonService {
	
	/* CommentDao ��� */
	
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception;
	
	public Comment addComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	/* FileDao ��� 
	 * fileDirectory : file�� �� ��� �� �ڿ� \\ �ʼ� �Է�.
	 * (ex) C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\
	 * */
	public String addFile(String fileDirectory, MultipartFile uploadFile);
	
	/* KakaoDao ���
	 * getAuto / getToken / kakaoPay
	 * */
	
	public String getAuthorizationUrl();
	
	public Map<String, Object> getAceessToken(String code) throws Exception;
	
	public String getPaymentReady(String token, int point) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception;

}

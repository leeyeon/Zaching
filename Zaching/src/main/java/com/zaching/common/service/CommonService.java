package com.zaching.common.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Comment;

public interface CommonService {
	
	/* CommentDao 사용 */
	
	public Map<String, Object> listComment(Search search, String categoryCode, int roomId) throws Exception;
	
	public Comment addComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	/* FileDao 사용 
	 * fileDirectory : file이 들어갈 경로 맨 뒤에 \\ 필수 입력.
	 * (ex) C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\
	 * */
	public String addFile(String fileDirectory, MultipartFile uploadFile);

}

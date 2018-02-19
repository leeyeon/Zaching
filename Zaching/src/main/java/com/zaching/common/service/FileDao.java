package com.zaching.common.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileDao {
	
	public String addFile(String fileDirectory, MultipartFile uploadFile);
	
	public String addFile(HttpServletRequest request, MultipartFile uploadFile);

}
